Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C956D26E;
	Sun, 26 Nov 2023 14:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ykkek6Dn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC963C433C9;
	Sun, 26 Nov 2023 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701008416;
	bh=5HL7Cy5319r95tB2zVJxxM8nekMUKbOq+0WJf7ZzUxc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ykkek6Dns6CS+idRclQOmJf7D4yBNOAqwsqTJmoUqUxezv7nb5Wl/5ZmN+sSmvplJ
	 ojTzW/Mq++hWPVLYiKTOIPkg6ej3EtkHttY+8CiSaTAltUPw126ECuLCw5gvY+b1BK
	 W8RzQb/691O+y/78CnzG3frhnSMu3zZ/TZx4HCy/gHK9z/Lf7hVfixnKiOWgsAG3hX
	 WQtjDsn6gPofdqDrckHc3g+mDqvBFKLi9IpuOFqXH//RadV7JGu1Py+68HofiOOzOq
	 jHz62vQPFC9oGXnMTvs51oyf6CNScXLBpUuYTB5zfYQx5fWRpaIk6SrrHHEoN42TcY
	 /TD9UEOZUptLg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-507a29c7eefso4448569e87.1;
        Sun, 26 Nov 2023 06:20:15 -0800 (PST)
X-Gm-Message-State: AOJu0YyBvL86RWFLUB7MXILCm3WerjkKFjL/75y19TnVZ4Y0BM1eYaB4
	8SoF5G3I90OAoYVMvjymQbybWX7nYVZWilz6Zog=
X-Google-Smtp-Source: AGHT+IGMPnMHJifpP9OnzUJx3ixD5EYSC3TeGDlHLFsAK5HSLZdh/LlekFARTL1mu8S/HW3qFUrD1/7bfsF2FrOpAK4=
X-Received: by 2002:ac2:4210:0:b0:50a:9fb9:91b with SMTP id
 y16-20020ac24210000000b0050a9fb9091bmr5011131lfh.64.1701008413926; Sun, 26
 Nov 2023 06:20:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231124035534.70432-1-wangrui@loongson.cn>
In-Reply-To: <20231124035534.70432-1-wangrui@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 26 Nov 2023 22:20:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H72pcXHQi-o71Ct7v+A1BSfNRTSzLrE9KMeS1dwd9KNnw@mail.gmail.com>
Message-ID: <CAAhV-H72pcXHQi-o71Ct7v+A1BSfNRTSzLrE9KMeS1dwd9KNnw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Apply dynamic relocations for LLD
To: WANG Rui <wangrui@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Xi Ruoyao <xry111@xry111.site>, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for loongarch-fixes, thanks.

Huacai

On Fri, Nov 24, 2023 at 11:56=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wro=
te:
>
> For the following assembly code:
>
>      .text
>      .global func
>  func:
>      nop
>
>      .data
>  var:
>      .dword func
>
> When linked with `-pie`, GNU LD populates the `var` variable with the
> pre-relocated value of `func`. However, LLVM LLD does not exhibit the
> same behavior. This issue also arises with the `kernel_entry` in
> arch/loongarch/kernel/head.S:
>
>  _head:
>      .word   MZ_MAGIC                /* "MZ", MS-DOS header */
>      .org    0x8
>      .dword  kernel_entry            /* Kernel entry point */
>
> The correct kernel entry from the MS-DOS header is crucial for jumping
> to vmlinux from zboot. This necessity is why the compressed kernel
> compiled by Clang encounters difficulties in booting.
>
> To address this problem, it is proposed to apply dynamic relocations to
> place with `--apply-dynamic-relocs`.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1962
> Signed-off-by: WANG Rui <wangrui@loongson.cn>
> ---
>  arch/loongarch/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index 1f0d74403419..05ab85118212 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -83,7 +83,7 @@ endif
>
>  ifeq ($(CONFIG_RELOCATABLE),y)
>  KBUILD_CFLAGS_KERNEL           +=3D -fPIE
> -LDFLAGS_vmlinux                        +=3D -static -pie --no-dynamic-li=
nker -z notext
> +LDFLAGS_vmlinux                        +=3D -static -pie --no-dynamic-li=
nker -z notext $(call ld-option, --apply-dynamic-relocs)
>  endif
>
>  cflags-y +=3D $(call cc-option, -mno-check-zero-division)
> --
> 2.43.0
>
>
