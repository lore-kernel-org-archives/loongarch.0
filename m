Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0909372
	for <loongarch@lists.linux.dev>; Sun, 25 Jun 2023 02:35:33 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-570284c7e61so21223467b3.1
        for <loongarch@lists.linux.dev>; Sat, 24 Jun 2023 19:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687660532; x=1690252532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGVGx8SjqYwUfEzfo92AjXT3wg7PYePtDlAlKCZ2ZtI=;
        b=PlDZbM5fazgJxBiQ/GPeqoFVq9els2RF3xcTCCoES5Pf0WroXG2sbEhL/hLEmB0tn+
         YqXNmsatWzstYXfkCmVU9n16mbEUCIVS+jjCnXAD6TbzBaHL5lgaglljWB/UXQnPZuzG
         pSjOlMuJMWX1I6AkQW0uF/VN2BGFT8EZPZqhRqfm0eFMcJ56VU/hjmpnyiHWerZtE+69
         ajXXSALxq7JOFQt05MSWE3nceZSB6v+iBEQN0acYvQ79VnvZHb+1A3ky0usimm2p22gY
         7bfMS/WCvRHuAV/slHNEnJpd/8GgJyiQdopVRir6llBBJpLkJgT1VdxH2yM+icNqJqa3
         P5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687660532; x=1690252532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGVGx8SjqYwUfEzfo92AjXT3wg7PYePtDlAlKCZ2ZtI=;
        b=GSIjSrA2HbBQ+A0wozhOuvyLJR0PSU5vcLoWRzthgCVGS1atlfhc3GoXuiJp8rNYQo
         TbaiQQcusGpAkCK7uxya0SjzhpietJuaklJKoZTORCfetIq6FaSmml65GpSqfyJR6c6O
         J4KRovDi2WCsnlkkpu6/chrg2gOSOLDL7noTvc/tic89X5TvNHCjbom9jAp1G8V2IcR5
         SXQwc5VJbETvKpLpnlU38MvhJKuF4X5l0wd80h+QOGJjqzoeLWr8dj7JWgt3Gh8q6HEx
         F+M+xtg6Kd+iPIOMZWShiqKxTBm9jeolpfOhRe63hn9Ou2po4qvgYAI+ulqHZZjcHbAs
         1mZg==
X-Gm-Message-State: AC+VfDzGCMFt35ekGXGqYJehzPbVodMq+RMCb8YXuQM007jbA849xIrV
	rkx60NVKymMTgBBlwvhKuKTm3j8ocwMegO57Xeg=
X-Google-Smtp-Source: ACHHUZ6eEFiyGlRr28sg4+XcHRCAdRZBjnVwQfmZ89hVYgHtqdZoNOTKSPIRPwYYqU72cXkW+O9dM3yz26Ki7V8ID34=
X-Received: by 2002:a81:4815:0:b0:56c:e563:23fc with SMTP id
 v21-20020a814815000000b0056ce56323fcmr27701408ywa.24.1687660532611; Sat, 24
 Jun 2023 19:35:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1685693501.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1685693501.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sun, 25 Jun 2023 10:35:20 +0800
Message-ID: <CAMpQs4LFunPW_7FAe+0Zyq5LMhcsRJ+qSGvARiQd-o6ZFn2qJg@mail.gmail.com>
Subject: Re: [PATCH V5 0/5] Add rtc driver for the Loongson family chips
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>, zhao zhang <zhzhl555@gmail.com>, 
	Yang Ling <gnaygnil@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre:

Gentle ping.
The dt-binding part of the patchset looks good now, do you have any
more comments on the driver part?

Thanks.
Binbin







On Fri, Jun 2, 2023 at 5:51=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> Hi all:
>
> The initial DT-base ls2x rtc driver was written by Wang Xuerui, He has
> released five versions of patchset before, and all related mail records
> are shown below if you are interested:
>
> https://lore.kernel.org/all/?q=3Dls2x-rtc
>
> In this series of patches, based on the code above, I have added the
> following support:
>
> 1. Add ACPI-related support, as Loongson-3A5000 + LS7A is now ACPI-base
>    by default under LoongArch architecture;
> 2. Add rtc alarm/walarm related functions;
> 3. Merge LS1X rtc and LS2X rtc into a unified rtc-loongson driver.
>
> I have tested on Loongson-3A5000LA+LS7A1000/LS7A2000, Loongson-2K1000LA,
> Loongson-2K0500 and Loongson-2K2000(ACPI/DT).
>
> Thanks to everyone for reviewing and testing the code.
>
> -------
> v5:
> patch(1/5)
>   - The reason why ls2x can be removed directly is explained in the
>     commit message;
>   - Use fallback compatible;
>     Thanks to all who participated in the fallback compatible discussion.
> patch(3/5)
>   - Since ls1b and ls1c have different register definitions, we'd better
>     distinguish them with different
>     configurations(ls1b_rtc_config/ls1c_rtc_config);
>   - Due to the use of fallback compatible, the redundant compatible is
>     removed. We can see the full list of supported chips in dt-binding..
>
> v4:
> https://lore.kernel.org/linux-rtc/cover.1684983279.git.zhoubinbin@loongso=
n.cn/
>
> - Rebase on the top of rtc-next;
> - Drop defconfig-related patches;
> patch(1/5)
>   - New patch, Loongson RTC bindings have been rewritten and we have
>     dropped the wildcard (ls2x) in compatible.
>     Thanks to Krzysztof for your comments;
> patch(2/5)
>   - New patch, drop the ls1x rtc driver;
> patch(3/5)
>   - Clear RTC_FEATURE_UPDATE_INTERRUPT bit, for the rtc does not support
>     UIE;
>   - Add LS2K2000 support(DT/ACPI);
>   - Merge ls1x support and name the driver rtc-loongson;
>     Thanks to Jiaxun for his comments and Keguang for his assistance in
> testing.
>
> v3:
> https://lore.kernel.org/linux-rtc/cover.1681370153.git.zhoubinbin@loongso=
n.cn/
>
> patch(2/7):
>  - Check patchset with "checkpatch.pl --strict";
>  - Drop static inline functions which are used only once, such as
>    ls2x_rtc_regs_to_time;
>  - Remove the suruct ls2x_rtc_regs and regmap_bulk_xxx() is used to read
>    and write rtc registers;
>  - Clear the RTC wakeup interrupt manually;
>  - Enable the RTC in set_time() and check in read_time();
>  - device_get_match_data() is used to get ls2x_pm_offset, for LS2k1000
>    has the different value;
>  - Remove some inexact CONFIG_ACPI.
>
> v2:
> 1. Rebased on top of latest loongarch-next;
> 2. Add interrupt descriptions to the ls2k and ls7a DTS files to avoid
> errors when the driver gets the IRQ number, Thanks to Qing Zhang for
> testing;
> 3. Remove some inexact CONFIG_ACPI.
>
> Thanks.
>
> Binbin Zhou (5):
>   dt-bindings: rtc: Remove the LS2X from the trivial RTCs
>   rtc: Remove the Loongson-1 RTC driver
>   rtc: Add rtc driver for the Loongson family chips
>   MIPS: Loongson64: DTS: Add RTC support to LS7A PCH
>   MIPS: Loongson64: DTS: Add RTC support to Loongson-2K1000
>
>  .../devicetree/bindings/rtc/loongson,rtc.yaml |  57 +++
>  .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 -
>  .../boot/dts/loongson/loongson64-2k1000.dtsi  |   7 +
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +
>  drivers/rtc/Kconfig                           |  23 +-
>  drivers/rtc/Makefile                          |   2 +-
>  drivers/rtc/rtc-loongson.c                    | 397 ++++++++++++++++++
>  drivers/rtc/rtc-ls1x.c                        | 192 ---------
>  8 files changed, 482 insertions(+), 205 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/loongson,rtc.ya=
ml
>  create mode 100644 drivers/rtc/rtc-loongson.c
>  delete mode 100644 drivers/rtc/rtc-ls1x.c
>
> --
> 2.39.1
>
>
