Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A54423AA
	for <loongarch@lists.linux.dev>; Fri, 23 Sep 2022 07:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB70C433D6
	for <loongarch@lists.linux.dev>; Fri, 23 Sep 2022 07:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663917377;
	bh=0tcsWPFJuJ+JlL9d8TQDqM0wY+okAAqCVZ/OiEHw45U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rJG+DfLqmZdouOHJ0mysxHFYu9iKaOMz+wi8FJ1+njiOCgY5Cu0YGiyZoyiB9QhtI
	 HXg2Sp6wWoIiz6uMNMWPEg2SkCZOm+03bDA7NR823IlLzH0fEDmQIIdZ3GIe8dgzD3
	 Z8kC66bDBhI8gPeXMzfDwGblQmk8WAWtAfhehVJaK/ViGXB7AarOoKGl5UqzcQd2SQ
	 pf4iDM5wgW3AQJPqptysvxC45F8QTWmIxVTKvbi2KYfnVRStxUCtR1rzpy8u0YiGk7
	 4JqRl2pMbn4DCfIXO/2PColmMmz9Jd69BxXm4OnBIiCmtlSbZcRkNEobUiiY09+b9P
	 ce/cj+iA7JdEw==
Received: by mail-vs1-f43.google.com with SMTP id q26so12777863vsr.7
        for <loongarch@lists.linux.dev>; Fri, 23 Sep 2022 00:16:16 -0700 (PDT)
X-Gm-Message-State: ACrzQf1qa0deqSZVaMakf/TIAPjOUzEbBKOmJFc6Mo1sgk6xhUTdsvKB
	wfzJo1Q0Ukj8nNLgnIfbn1CdbhqElLVbrz6Uxpg=
X-Google-Smtp-Source: AMsMyM5y4VoSXLt6JYBz789A2bqg2P0a6bGsOz1xz6qwcf9P77Rub6RQld7QuxGsmB/tk/HzZ5dgYTB4ePorEu2q/rM=
X-Received: by 2002:a05:6102:1481:b0:39a:67f5:3096 with SMTP id
 d1-20020a056102148100b0039a67f53096mr2762228vsv.70.1663917375962; Fri, 23 Sep
 2022 00:16:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1663835855.git.zhoubinbin@loongson.cn> <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>
 <YyxTwl7mos/hARWm@black.fi.intel.com>
In-Reply-To: <YyxTwl7mos/hARWm@black.fi.intel.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 23 Sep 2022 15:16:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4waMMDnctjkC61P6eurLuPfhs1+UP1vLc-XwHXieEhgQ@mail.gmail.com>
Message-ID: <CAAhV-H4waMMDnctjkC61P6eurLuPfhs1+UP1vLc-XwHXieEhgQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] i2c: core: Pick i2c bus number from ACPI if present
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Wolfram Sang <wsa@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, 
	loongarch@lists.linux.dev, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Mika,

On Thu, Sep 22, 2022 at 8:23 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Thu, Sep 22, 2022 at 07:39:54PM +0800, Binbin Zhou wrote:
> > Under LoongARCH based on ACPI(such as Loongson-3A + LS7A), the ls2x i2c
> > driver obtains the i2c bus number from ACPI table.
>
> Why this is needed? The I2CSerialBusV2() resource should be enough to
> identify the adapter, and I don't see why static number would be needed
> for anything?
>
In later patches we will add LS7A i2c driver, this driver is shared by
MIPS-based Loongson-3A4000 system (use FDT) and LoongArch-based
Loongson-3A5000 system (use ACPI).

FDT systems support static bus numbers, so we want to do the same
thing on ACPI systems. I think keep this consistency can make user
feel better


Huacai
