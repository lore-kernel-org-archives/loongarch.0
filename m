Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A8DC2FF
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 11:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68CBC433C9
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692963525;
	bh=IhUN3wNeroegBsvK8L6MatBOMRiD07StyURe84Lkn7Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DsBucCM0VnBjdcpnWKUI8s5DRCMzPqGICyZvN85ukU7qUJ1CRay5m/cbVoXEd3zo5
	 dLB2u3UpSQ1rvWeDGp6bOKtdELGNBCkBakgdMDprZtxsM3D1LD7IKJPOnBgfa+Ihsd
	 rNMTkD3kQKvp38FtkWUwYgnVW/coadBnM6H/nZuPELDTk8sfWvjglqxiyM0HkmhNlJ
	 0mb1MoJE/gzt2b41CguKAJQLYQBHckPXrZ7bJEN1in0RkgT/RPv9b62xEP8k6jeTLx
	 Is0t22DUFjMTvzO+2PtFtQVcGcgig1U6gG9auWI8yi9buwNYuJMbyPtT2rI0WNiQMw
	 3mE+oeuM+Y2vQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so1236060e87.1
        for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 04:38:45 -0700 (PDT)
X-Gm-Message-State: AOJu0YzZLJBo+vbC5noQb5aoNR7kRjExxlXAL9Ra/00ms2WKGWacHwfD
	e70j++UjQ0emkCtjRgSh38pYqgLZmLRnphOyJHk=
X-Google-Smtp-Source: AGHT+IFjMLJMaychfDPevyx63YRANWX74ZsjU8alQfZvoD4k7trTbs70l3tz4UR+TfzKoeCMfdvckNnPUazn/+ciTh8=
X-Received: by 2002:a05:6512:3706:b0:4f9:586b:dba1 with SMTP id
 z6-20020a056512370600b004f9586bdba1mr10516325lfr.4.1692963523857; Fri, 25 Aug
 2023 04:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1692783907.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1692783907.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 25 Aug 2023 19:38:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7hi=yc=PfDBafXVS5CSwEeE2WmbAAhnnDm6iYFF3YzkQ@mail.gmail.com>
Message-ID: <CAAhV-H7hi=yc=PfDBafXVS5CSwEeE2WmbAAhnnDm6iYFF3YzkQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] LoongArch: Add built-in dtb support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, loongson-kernel@lists.loongnix.cn, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This series looks good enough to me now, if no one has objections, I
will queue it to loongarch-next.

Huacai

On Wed, Aug 23, 2023 at 5:55=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Hi all:
>
> This patchset introduces LoongArch's built-in dtb support.
>
> As we know, the Loongson-2K family supports DT. Inevitably, some systems
> do not provide a useful device tree to the kernel at boot time. Chasing
> around bootloaders for these systems is a headache, so we just keep a
> device tree table in the kernel, keyed by the dts filename, that
> contains the relevant DTBs.
>
> Thanks.
>
> -----
> V4:
> patch(1/7):
>   - Drop device_type property.
> patch(2/7):
>   - Rename board.yaml to loongson.yaml.
> patch(4/7):
>   - Keep the ranges attribute after compatible;
>   - Add bootargs =3D "ttyS0,115200", which is needed for reference board;
> patch(5/7):
>   - Keep the ranges attribute after compatible;
>   - Add bootargs =3D "ttyS0,115200", which is needed for reference board;
>   - Change node name global-utilities to chipid.
> patch(6/7):
>   - Keep the ranges attribute after compatible;
>   - Add bootargs =3D "ttyS0,115200", which is needed for reference board.
>
> Link to V3:
> https://lore.kernel.org/all/cover.1692618548.git.zhoubinbin@loongson.cn/
>
> V3:
> patch(1/7):
>   - Add reference to the common cpu schema.
> patch(2/7):
>   - Add reviewed-by tag.
> patch(4/7):
>   - Drop bootargs;
>   - Move the cpus node to dtsi, which is part of the SoC.
> patch(5/7):
>   - Drop bootargs;
>   - Move the cpus node to dtsi, which is part of the SoC;
>   - Fix gmac0/1-mdio node: compatible is always the first property;
>   - Drop i2c-gpio node.
> patch(6/7):
>   - Drop bootargs;
>   - Move the cpus node to dtsi, which is part of the SoC.
>   - Changes liointc to liointc-1.0, for Loongson-2K2000 has 32 interrupt
>     sources.
>
> Link to V2:
> https://lore.kernel.org/all/cover.1692088166.git.zhoubinbin@loongson.cn/
>
> V2:
> patch(1/7):
>   - Drop model and clock-frequency properties;
>   - Add clocks property;
>   - Rewrite the description.
> patch(2/7):
>   - Add the proper compatibles for boards.
> patch(4/7)(5/7)(6/7):
>   - Format commit message head;
>   - Drop undocumented compatible, such as pci_bridge compatible;
>   - Distinguish the attributes, put SoC-related into DTSI and
>     board-related into DTS;
>   - Check DTS with 'make dtbs_check W=3D1'.
> patch(7/7)
>   - New patch;
>   - Parses Molde name and CPU MHz from the DTS attribute.
>
> Link to V1:
> https://lore.kernel.org/loongarch/cover.1686882123.git.zhoubinbin@loongso=
n.cn/
>
> Binbin Zhou (7):
>   dt-bindings: loongarch: Add CPU bindings for LoongArch
>   dt-bindings: loongarch: Add Loongson SoC boards compatibles
>   LoongArch: Allow device trees to be built into the kernel
>   LoongArch: dts: DeviceTree for Loongson-2K0500
>   LoongArch: dts: DeviceTree for Loongson-2K1000
>   LoongArch: dts: DeviceTree for Loongson-2K2000
>   LoongArch: Parsing CPU-related information from DTS
>
>  .../devicetree/bindings/loongarch/cpus.yaml   |  61 +++
>  .../bindings/loongarch/loongson.yaml          |  34 ++
>  arch/loongarch/Kconfig                        |  16 +
>  arch/loongarch/Makefile                       |  10 +-
>  arch/loongarch/boot/dts/Makefile              |   7 +-
>  .../boot/dts/loongson-2k0500-ref.dts          |  89 ++++
>  arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 254 +++++++++++
>  .../boot/dts/loongson-2k1000-ref.dts          | 172 ++++++++
>  arch/loongarch/boot/dts/loongson-2k1000.dtsi  | 397 ++++++++++++++++++
>  .../boot/dts/loongson-2k2000-ref.dts          |  73 ++++
>  arch/loongarch/boot/dts/loongson-2k2000.dtsi  | 291 +++++++++++++
>  arch/loongarch/kernel/env.c                   |  33 ++
>  arch/loongarch/kernel/setup.c                 |   9 +-
>  13 files changed, 1440 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/loongarch/cpus.yaml
>  create mode 100644 Documentation/devicetree/bindings/loongarch/loongson.=
yaml
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k0500-ref.dts
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k0500.dtsi
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k1000-ref.dts
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k1000.dtsi
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k2000-ref.dts
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k2000.dtsi
>
> --
> 2.39.3
>
