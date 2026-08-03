# Постоянные ссылки на дистрибутивы JetBrains

Официальная схема «вечных» ссылок JetBrains — редирект (`302`) на актуальный файл в CDN:

```
https://download.jetbrains.com/product?code=<КОД>&latest&distribution=<ПЛАТФОРМА>
```

`<ПЛАТФОРМА>` — те же ключи, что в объекте `downloads` у API релизов
(`https://data.services.jetbrains.com/products/releases?code=<КОД>&latest=true&type=release`).

## Матрица загрузок

Подпись ссылки — значение параметра `distribution`.

| Продукт | amd64 / linux | amd64 / win | arm64 / macos | arm64 / linux | arm64 / win |
|---|---|---|---|---|---|
| IntelliJ IDEA Ultimate (`IIU`) | [linux](https://download.jetbrains.com/product?code=IIU&latest&distribution=linux) | [windows](https://download.jetbrains.com/product?code=IIU&latest&distribution=windows) | [macM1](https://download.jetbrains.com/product?code=IIU&latest&distribution=macM1) | [linuxARM64](https://download.jetbrains.com/product?code=IIU&latest&distribution=linuxARM64) | [windowsARM64](https://download.jetbrains.com/product?code=IIU&latest&distribution=windowsARM64) |
| IntelliJ IDEA Community (`IIC`) | [linux](https://download.jetbrains.com/product?code=IIC&latest&distribution=linux) | [windows](https://download.jetbrains.com/product?code=IIC&latest&distribution=windows) | [macM1](https://download.jetbrains.com/product?code=IIC&latest&distribution=macM1) | [linuxARM64](https://download.jetbrains.com/product?code=IIC&latest&distribution=linuxARM64) | [windowsARM64](https://download.jetbrains.com/product?code=IIC&latest&distribution=windowsARM64) |
| PyCharm Professional (`PCP`) | [linux](https://download.jetbrains.com/product?code=PCP&latest&distribution=linux) | [windows](https://download.jetbrains.com/product?code=PCP&latest&distribution=windows) | [macM1](https://download.jetbrains.com/product?code=PCP&latest&distribution=macM1) | [linuxARM64](https://download.jetbrains.com/product?code=PCP&latest&distribution=linuxARM64) | [windowsARM64](https://download.jetbrains.com/product?code=PCP&latest&distribution=windowsARM64) |
| PyCharm Community (`PCC`) | [linux](https://download.jetbrains.com/product?code=PCC&latest&distribution=linux) | [windows](https://download.jetbrains.com/product?code=PCC&latest&distribution=windows) | [macM1](https://download.jetbrains.com/product?code=PCC&latest&distribution=macM1) | [linuxARM64](https://download.jetbrains.com/product?code=PCC&latest&distribution=linuxARM64) | [windowsARM64](https://download.jetbrains.com/product?code=PCC&latest&distribution=windowsARM64) |
| GoLand (`GO`) | [linux](https://download.jetbrains.com/product?code=GO&latest&distribution=linux) | [windows](https://download.jetbrains.com/product?code=GO&latest&distribution=windows) | [macM1](https://download.jetbrains.com/product?code=GO&latest&distribution=macM1) | [linuxARM64](https://download.jetbrains.com/product?code=GO&latest&distribution=linuxARM64) | [windowsARM64](https://download.jetbrains.com/product?code=GO&latest&distribution=windowsARM64) |
| WebStorm (`WS`) | [linux](https://download.jetbrains.com/product?code=WS&latest&distribution=linux) | [windows](https://download.jetbrains.com/product?code=WS&latest&distribution=windows) | [macM1](https://download.jetbrains.com/product?code=WS&latest&distribution=macM1) | [linuxARM64](https://download.jetbrains.com/product?code=WS&latest&distribution=linuxARM64) | [windowsARM64](https://download.jetbrains.com/product?code=WS&latest&distribution=windowsARM64) |
| PhpStorm (`PS`) | [linux](https://download.jetbrains.com/product?code=PS&latest&distribution=linux) | [windows](https://download.jetbrains.com/product?code=PS&latest&distribution=windows) | [macM1](https://download.jetbrains.com/product?code=PS&latest&distribution=macM1) | [linuxARM64](https://download.jetbrains.com/product?code=PS&latest&distribution=linuxARM64) | [windowsARM64](https://download.jetbrains.com/product?code=PS&latest&distribution=windowsARM64) |
| CLion (`CL`) | [linux](https://download.jetbrains.com/product?code=CL&latest&distribution=linux) | [windows](https://download.jetbrains.com/product?code=CL&latest&distribution=windows) | [macM1](https://download.jetbrains.com/product?code=CL&latest&distribution=macM1) | [linuxARM64](https://download.jetbrains.com/product?code=CL&latest&distribution=linuxARM64) | [windowsARM64](https://download.jetbrains.com/product?code=CL&latest&distribution=windowsARM64) |
| Rider (`RD`) | [linux](https://download.jetbrains.com/product?code=RD&latest&distribution=linux) | [windows](https://download.jetbrains.com/product?code=RD&latest&distribution=windows) | [macM1](https://download.jetbrains.com/product?code=RD&latest&distribution=macM1) | [linuxARM64](https://download.jetbrains.com/product?code=RD&latest&distribution=linuxARM64) | [windowsARM64](https://download.jetbrains.com/product?code=RD&latest&distribution=windowsARM64) |
| RubyMine (`RM`) | [linux](https://download.jetbrains.com/product?code=RM&latest&distribution=linux) | [windows](https://download.jetbrains.com/product?code=RM&latest&distribution=windows) | [macM1](https://download.jetbrains.com/product?code=RM&latest&distribution=macM1) | [linuxARM64](https://download.jetbrains.com/product?code=RM&latest&distribution=linuxARM64) | [windowsARM64](https://download.jetbrains.com/product?code=RM&latest&distribution=windowsARM64) |
| DataGrip (`DG`) | [linux](https://download.jetbrains.com/product?code=DG&latest&distribution=linux) | [windows](https://download.jetbrains.com/product?code=DG&latest&distribution=windows) | [macM1](https://download.jetbrains.com/product?code=DG&latest&distribution=macM1) | [linuxARM64](https://download.jetbrains.com/product?code=DG&latest&distribution=linuxARM64) | [windowsARM64](https://download.jetbrains.com/product?code=DG&latest&distribution=windowsARM64) |
| DataSpell (`DS`) | [linux](https://download.jetbrains.com/product?code=DS&latest&distribution=linux) | [windows](https://download.jetbrains.com/product?code=DS&latest&distribution=windows) | [macM1](https://download.jetbrains.com/product?code=DS&latest&distribution=macM1) | [linuxARM64](https://download.jetbrains.com/product?code=DS&latest&distribution=linuxARM64) | [windowsARM64](https://download.jetbrains.com/product?code=DS&latest&distribution=windowsARM64) |
| Toolbox App (`TBA`) | [linux](https://download.jetbrains.com/product?code=TBA&latest&distribution=linux) | [windows](https://download.jetbrains.com/product?code=TBA&latest&distribution=windows) | [macM1](https://download.jetbrains.com/product?code=TBA&latest&distribution=macM1) | [linuxARM64](https://download.jetbrains.com/product?code=TBA&latest&distribution=linuxARM64) | [windowsARM64](https://download.jetbrains.com/product?code=TBA&latest&distribution=windowsARM64) |

Все 65 комбинаций проверены — отдают `302`. Неизвестное значение `distribution` даёт `404`,
так что опечатка видна сразу.

## Куда резолвились ссылки на 2026-08-04

| Продукт | Версия | Файл (amd64 / linux) |
|---|---|---|
| `IIU` | 2026.2.0.1 | `idea-2026.2.0.1.tar.gz` |
| `IIC` | 2025.3 | `idea-2025.3.tar.gz` |
| `PCP` | 2026.2.0.1 | `pycharm-2026.2.0.1.tar.gz` |
| `PCC` | 2025.3 | `pycharm-2025.3.tar.gz` |
| `GO` | 2026.2.0.1 | `goland-2026.2.0.1.tar.gz` |
| `WS` | 2026.2.0.1 | `WebStorm-2026.2.0.1.tar.gz` |
| `PS` | 2026.2.0.1 | `PhpStorm-2026.2.0.1.tar.gz` |
| `CL` | 2026.2.0.1 | `CLion-2026.2.0.1.tar.gz` |
| `RD` | 2026.2.0.2 | `JetBrains.Rider-2026.2.0.2.tar.gz` |
| `RM` | 2026.2 | `RubyMine-2026.2.tar.gz` |
| `DG` | 2026.2.2 | `datagrip-2026.2.2.tar.gz` |
| `DS` | 2026.1.3 | `dataspell-2026.1.3.tar.gz` |
| `TBA` | 3.6.3.86383 | `jetbrains-toolbox-3.6.3.86383.tar.gz` |

## Примечания

- **Единый дистрибутив.** С 2025.3 IntelliJ IDEA и PyCharm поставляются одной сборкой:
  ссылки `IIC` и `PCC` ведут на файл с `productCode: IU` / `PY` и с тех пор заморожены на 2025.3.
  Отдельных Community-сборок больше не выпускают, бесплатный режим включается отсутствием лицензии.
  Для актуальной версии используйте `IIU` / `PCP`.
- **amd64 / macos** в таблице нет по условию задачи; ключ — `distribution=mac`, работает так же.
- **EAP:** добавить `&type=eap`, например
  `https://download.jetbrains.com/product?code=IIU&latest&distribution=linux&type=eap`.
- **Контрольные суммы** через этот эндпоинт не отдаются. Либо резолвить редирект и дописать
  `.sha256` к итоговому имени файла, либо брать `checksumLink` из API релизов.
- **Снятые с разработки** продукты (`AI` — AppCode, `QA` — Aqua) редиректа не дают.
- В Ansible `get_url` следует редиректам сам, отдельных флагов не нужно; `curl` требует `-L`.

Плейбуки, использующие API релизов: `ans/playbooks/idea-u.yaml`, `ans/playbooks/idea-c.yaml`.