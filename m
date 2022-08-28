Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FF33214
	for <loongarch@lists.linux.dev>; Sun, 28 Aug 2022 14:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0AA9C433B5
	for <loongarch@lists.linux.dev>; Sun, 28 Aug 2022 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661696147;
	bh=F8Rzx597evTrKV+vnDZAGsL1yBRhZNPv/ubmR5QIItQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GYQWRpTlQQydmzfMIJd52PHL7WewEnlRmLXmF/ME3rKNdgaWIfkbZnfBJaetCrPYb
	 oyJXyddLIRcz9aDEWX/F5vCS8ko7dc3Cx7MykCmzpkAvVMP1sbHQLWpe97jvzzUVPH
	 SiTlvylR+SWEX3Xrvl753wmz3YfELXnOnUnMlhKM7m3iOIe/QJrDzcm9CKBmwWpL9J
	 YTXrXFaucyQo1FlJ7HP9nmpad02MmWn+Fgb0coCYE4o1du4ZcuVsXCo0F/oL41QoxL
	 3e7zokHqgssVINSHaY+ctV9momiaAwKvml0a/NQQ3to/Pm/2i8ffD7LJ7e/YLMDgGW
	 LjsA1ipeGtj9A==
Received: by mail-ua1-f44.google.com with SMTP id l19so206872uap.6
        for <loongarch@lists.linux.dev>; Sun, 28 Aug 2022 07:15:47 -0700 (PDT)
X-Gm-Message-State: ACgBeo110T32va7OHZMfqgUForiP45CInqN9M8EyUmYuLTzwmU08ejit
	rlNu4yI9W6nFfOopY+FaPr7kAFm14hchKIrzg0Y=
X-Google-Smtp-Source: AA6agR7e0WdTCaQoFePPh5prwSYiB3W4LOJTV9kd8n4LxfAAH2LlJFMk3MSNZGRwvCHEm7DQRDPdGOY6zGQRdIkorGo=
X-Received: by 2002:ab0:4565:0:b0:395:b672:508 with SMTP id
 r92-20020ab04565000000b00395b6720508mr2190652uar.63.1661696146782; Sun, 28
 Aug 2022 07:15:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220827175436.156464-1-xry111@xry111.site> <20220827175436.156464-2-xry111@xry111.site>
In-Reply-To: <20220827175436.156464-2-xry111@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 28 Aug 2022 22:15:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7-MNd9WsnB3r2kxRN7LveixGwQZ=qTVHB_XvW+uU9q4Q@mail.gmail.com>
Message-ID: <CAAhV-H7-MNd9WsnB3r2kxRN7LveixGwQZ=qTVHB_XvW+uU9q4Q@mail.gmail.com>
Subject: Re: [PATCH 1/8] LoongArch: Add CONFIG_CC_HAS_EXPLICIT_RELOCS
To: Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Youling Tang <tangyouling@loongson.cn>, 
	Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Ruoyao,

On Sun, Aug 28, 2022 at 1:55 AM Xi Ruoyao <xry111@xry111.site> wrote:
>
> GNU as >= 2.40 and GCC >= 13 will support using explicit relocation
> hints in the assembly code, instead of la.* macros.  The usage of
> explicit relocation hints can improve code generation so it's enabled
> by default by GCC >= 13.  We need to adapt the kernel for this change,
> introduce CONFIG_CC_HAS_EXPLICIT_RELOCS so we can use it in later
> patches.
>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/loongarch/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 810096bbf853..e7cfd451024b 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -203,6 +203,9 @@ config SCHED_OMIT_FRAME_POINTER
>         bool
>         default y
>
> +config CC_HAS_EXPLICIT_RELOCS
> +       def_bool $(cc-option,-mexplicit-relocs) && $(as-instr,x:pcalau12i \$t0$(comma)%pc_hi20(x))
Is it possible that we only change the Makefile and not touch Kconfig?



Huacai
> +
>  menu "Kernel type and options"
>
>  source "kernel/Kconfig.hz"
> --
> 2.37.0
>
>
