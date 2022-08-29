Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49737C
	for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 11:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2BAC43470
	for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 11:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661771910;
	bh=fpt/38wI087gZxxVJZedw7NMuIynb21K6uf3UFvOwDU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B75XTaN6by5tSHcf6mM05wwWWL0lynG9ahNfP0WiVG7ola7CFolG7czog3rkf4uDP
	 NTZuPEV+fN32JwwqCXfRewnZDxZA/vv8AQaT8kU/RiepPwhY565ZyJRmgy3TEOqoDQ
	 cUqTLIMIDGO8GeA9YQjWz81vNjBHKpO+Pc0eOfgxs18k1OFxzM1Ee5XB+syFmO2pi4
	 5o02WakWRtCkhwsPOVcJuWPDFKIunvmrW1f8iq+yWQ+p7pQHvq6PNQ/Rlsu6n1/+zU
	 TEJJ3Wft87KyEtXo/k+CkIxrWNgJmbJhNfeXZTHdx5223L/dRSkxmac8gcclYGjXfZ
	 TdY5p6+7gpH5w==
Received: by mail-ua1-f45.google.com with SMTP id d14so2972252ual.9
        for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 04:18:30 -0700 (PDT)
X-Gm-Message-State: ACgBeo2rJplAIpRJBV4Pk8V5IUCSJ6gPZI6918uRlkU/MgzaOtvdT0uJ
	I/X4VltF8f9pytQ816g3fVCILU4PDWVIbdfczn0=
X-Google-Smtp-Source: AA6agR6TM1ay2sWGgvmwk7suH1NCwAt/b4hH3wheL74RS1FBbrKdQcCnucOqZcbzmcs5EkRGlXfBcktbPyhBABk41tg=
X-Received: by 2002:ab0:d82:0:b0:39e:db4c:c80c with SMTP id
 i2-20020ab00d82000000b0039edb4cc80cmr3107265uak.22.1661771909479; Mon, 29 Aug
 2022 04:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220827175436.156464-1-xry111@xry111.site> <CAAhV-H4+=CqeRUUt+XPZ2Nf=1GRgHtTFyMuVu-y6QdgQgD4mog@mail.gmail.com>
 <b681993ca92d5243a73e23303ff9386ad03cf05a.camel@xry111.site>
 <CAAhV-H5tB9nvD8Uufn5SQ1s0hzob4TuxRTaSri-cxHVqtRH6uw@mail.gmail.com> <927f85844e31f0563523622134b5d01af6991e60.camel@xry111.site>
In-Reply-To: <927f85844e31f0563523622134b5d01af6991e60.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 29 Aug 2022 19:18:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5-NhSvHwc4_bEafkrxfi5Aq4ePiHK7PdFkGupSDRDVVA@mail.gmail.com>
Message-ID: <CAAhV-H5-NhSvHwc4_bEafkrxfi5Aq4ePiHK7PdFkGupSDRDVVA@mail.gmail.com>
Subject: Re: [PATCH 0/8] LoongArch: Support toolchain with new relocation types
To: Xi Ruoyao <xry111@xry111.site>
Cc: Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Youling Tang <tangyouling@loongson.cn>, Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Ruoyao,

On Mon, Aug 29, 2022 at 1:04 PM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Mon, 2022-08-29 at 12:33 +0800, Huacai Chen wrote:
> > > If we'll drop support for old GCC/Binutils, we can drop patch 5 (it's
> > > only needed for the combination of old GCC and new Binutils).  Then
> > > squash 4 and 7.  8 should still be standalone IMO.
>
> > Whether we can drop old toolchains depends on Arnd. :)
>
> I'd like to prepare V6 after we can make a final decision.
I think we can assume that we should support old toolchains until Arnd
responds, but again, we can only consider new/new and old/old.
>
> > But even if we should support old toolchains, I think we only need to
> > consider new binutils + new gcc and old binutils + old gcc, I don't
> > think new binutils + old gcc and old binutils + new gcc can exist in
> > the real world.
>
> Generally, how do we report an unsupported configuration in kernel
> building system?  With a $(error, "message") in the Makefile, or in some
> header with a #error?  I don't want to leave an unsupported
> configuration silently generating modules which can't be loaded by the
> kernel.

$(error, "message") in the Makefile is fine to me,  you can "grep
error arch -rwI | grep Makefile".

Huacai
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
>
