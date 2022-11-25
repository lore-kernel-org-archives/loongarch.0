Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8154315B5
	for <loongarch@lists.linux.dev>; Fri, 25 Nov 2022 01:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354D1C4347C
	for <loongarch@lists.linux.dev>; Fri, 25 Nov 2022 01:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669340465;
	bh=Y3BHuC/gbFrlwqqRocEoyTJHEdrLgDfaWv7cGqRXibA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kgn7RiqA0HAdbX+Js/oee5EudXsHbvhMyICPboFz14PGyuY4nZtGrDIEIWoDzbKcn
	 zZ1grrHhfPW4x26F+VmPblbs5Qox2H7RrO2tzuW0RbjtjSiQlzRvh6jyeRyEgM+KYf
	 77/me/hUXNv6sbcU8JbPuCD7m6nzCBp9SJ1tHDAQz+Tm6vdI/Zo2IvOgTi32yrJ7QG
	 f+QZ9FWeWLgDHPsorMEsnvPP3pftuOxLWjWfkrOIqVNv0gaY/yGMrgwT/K2r97UhJQ
	 jYi7g/G+4r5LbBYw4LrQWwVG4o2w9Yv5Vv2b3127VfxC6E0JmtC22FXKTeG23A2TQV
	 PPqcf0/8h1peQ==
Received: by mail-ej1-f42.google.com with SMTP id vp12so5982470ejc.8
        for <loongarch@lists.linux.dev>; Thu, 24 Nov 2022 17:41:05 -0800 (PST)
X-Gm-Message-State: ANoB5pk3uer75QyQWzyaCjzx9Gdnm5ANVNH5hHcp4h1ANt9JQALZfqtc
	xs7febMLIv77w4r+JBj7+mUSl/h2lhzvDkeFXP4=
X-Google-Smtp-Source: AA0mqf6pp4RtiVd1wxN3Spsj315yGYT2Ld7iTuXwOKiCAo8yDYdoMSQoNyzyt1gyODyBzbSiqFY1Z5h7ZiD8ljKcQoo=
X-Received: by 2002:a17:907:2143:b0:7ae:27ed:e90e with SMTP id
 rk3-20020a170907214300b007ae27ede90emr29440485ejb.224.1669340463433; Thu, 24
 Nov 2022 17:41:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1669291172.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1669291172.git.siyanteng@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 25 Nov 2022 09:40:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5ufJgL=cK1b5UAxtb5DDw0at5pNpttV6nGrLu_7k5FDA@mail.gmail.com>
Message-ID: <CAAhV-H5ufJgL=cK1b5UAxtb5DDw0at5pNpttV6nGrLu_7k5FDA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] docs/LoongArch: Add English and Chinese versions
 of boot image header
To: Yanteng Si <siyanteng@loongson.cn>
Cc: corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com, kernel@xen0n.name, 
	wu.xiangcheng@linux.dev, jiaxun.yang@flygoat.com, liuyun@loongson.cn, 
	linux-doc@vger.kernel.org, loongarch@lists.linux.dev, siyanteng01@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi, Yanteng,

I hope you can add a description about boot parameters (a0=efi_boot
a1=cmdline a2=systemtable), and then rename the file to booting.rst.

Huacai

On Thu, Nov 24, 2022 at 8:11 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> v2:
> * Fix magic start address.
> * res14 -> res4.
>
> v1:
> * Add boot image header.
> * Translate boot-image-header into Chinese.
>
> Yanteng Si (2):
>   docs/LoongArch: Add boot image header
>   docs/zh_CN: Add boot-image-header Chinese translation
>
>  Documentation/loongarch/boot-image-header.rst | 76 ++++++++++++++++++
>  Documentation/loongarch/index.rst             |  1 +
>  .../zh_CN/loongarch/boot-image-header.rst     | 77 +++++++++++++++++++
>  .../translations/zh_CN/loongarch/index.rst    |  1 +
>  4 files changed, 155 insertions(+)
>  create mode 100644 Documentation/loongarch/boot-image-header.rst
>  create mode 100644 Documentation/translations/zh_CN/loongarch/boot-image-header.rst
>
> --
> 2.31.1
>
>
