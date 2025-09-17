Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F84C28B4FA
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 07:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758092659; cv=none; b=j57wcBSaVd73vBXIuGd7lyTDmnL/xqUmn6F16clcXeQAAyXC0HcAfdLb1D4kdQqfgqJ5F+np8YVvtYSRlBpwfdy3roiMGmreLkuav76xi26ekCD/2ogDMRlI1Aw1fe+y8lnBcUxW4l62wo4pYaAifPmr+9+7M3iqebW6vMNtpH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758092659; c=relaxed/simple;
	bh=Uflx33fR+8LD+kDHDW5IzWzB2Im26c4pj9McyHLVoSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5+SJvfHc4L4IX+ZYWGC1jJiGB85YtNwlcYbZLcIm483gq82qZUmEZB+e7p09HWSDQAI2ak3a38K7bWsmhBg3bSMbbIzqO1jLYyCFp628szXqMj6+M6KCzQhOMs7kk9ETl8yyOgI9GwPXcBLtw7whQX9smCxUYLXBGdKLEprexo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOZ2mHPx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOZ2mHPx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D038EC4AF0B
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 07:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758092658;
	bh=Uflx33fR+8LD+kDHDW5IzWzB2Im26c4pj9McyHLVoSg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iOZ2mHPxsnLD5O57e7GHWReLbk32D96zAM93fAO/cNzcGZFkpn+zeKJXwK6onfO09
	 mCb/vgEOvCOG0E7Wo9rl/2hCRX5N+1FpQjcuXZt5v/B2ZOOflkzEcVHTox8AwqB9nd
	 gRk6IxWX1GWkIOjkcsztYH/Seu6HYzXmoKnFYqD+r2YlMr3VgZgWkSXpks14SMxfoV
	 k/1lWoTtPWGjVCtMgayaqBMRc0LfMXYB7wbZzohh/i1m2KGtfAQmeaI1yW6xsqFDCz
	 XiNPZrGgD6NgXZdAQmyJJQkTcO1OVujo44Y0nhXgnmcMbKMHjcuGIjs2TdNRl4RxHz
	 N0Y6u9eJO/Lsw==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so1048345966b.2
        for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 00:04:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXu8/ee6w14UIsZh5ONsRbT5CYnDtaiOZPkuDYCr3CH5lwiPbEvkr7f4ttx3EjD6qUGqf9G3t6+P4s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtooGmJqGTbJRfTsqpsBl2KF4K2A5SfPjdU0ztuyjmjIrU+ls+
	/EuWbo6XInK1BJL6OQgSz7SAH9lerm3QVG38XI8U2fGbCfUyEJVpHuUxqSYkSyj2dWnnKBGNIcv
	Oz7xhdM+xCXbEnCRtZkCewlOsOSKWKeo=
X-Google-Smtp-Source: AGHT+IFAG0WT1piPvAGv5bYg8dQyjolnBbGnqOkc5hMctxmRQoCDOeMEIeViuOGAl1F4p4eEQETGkkI7PMNcAvgUg7A=
X-Received: by 2002:a17:907:9728:b0:b07:e3a8:51a3 with SMTP id
 a640c23a62f3a-b1bb0d3b8fcmr139645366b.23.1758092657403; Wed, 17 Sep 2025
 00:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250917011007.4540-1-yangtiezhu@loongson.cn> <20250917011007.4540-3-yangtiezhu@loongson.cn>
In-Reply-To: <20250917011007.4540-3-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 17 Sep 2025 15:04:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6L6nSuDxn_8cpexmSdLjO6DLLG0+9faPdhuD9iFMfdVw@mail.gmail.com>
X-Gm-Features: AS18NWAPKxE-gEi7ZGhhnolLV3IFlggmd-t-A5OMbkxfKidQyckND9zJg7oqLVo
Message-ID: <CAAhV-H6L6nSuDxn_8cpexmSdLjO6DLLG0+9faPdhuD9iFMfdVw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] objtool/LoongArch: Fix unreachable instruction
 warnings about image header
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

Patch-2 and Patch-3 can be squashed.

Huacai

On Wed, Sep 17, 2025 at 9:10=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> When compiling with LLVM and CONFIG_LTO_CLANG is set, there exist the
> following objtool warnings:
>
>   vmlinux.o: warning: objtool: .head.text+0x0: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x18: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x38: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x3c: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x40: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x44: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x54: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x58: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x6c: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x84: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x94: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x9c: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0xc4: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0xf8: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0xfc: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x104: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x10c: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x11c: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x120: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x124: unreachable instruction
>   vmlinux.o: warning: objtool: .head.text+0x144: unreachable instruction
>
> All of the above instructions are in arch/loongarch/kernel/head.S,
> and there is "OBJECT_FILES_NON_STANDARD_head.o :=3D y" in Makefile
> to skip objtool checking for head.o, but OBJECT_FILES_NON_STANDARD
> does not work for link time validation of vmlinux.o according to
> tools/objtool/Documentation/objtool.txt.
>
> After many discussions, it is not proper to ignore .head.text section
> in objtool or put them from text section to data section, so just give
> a unwind hint to fix the above warnings.
>
> Link: https://lore.kernel.org/lkml/20250814083651.GR4067720@noisy.program=
ming.kicks-ass.net/
> Link: https://lore.kernel.org/lkml/CAAhV-H6A_swQmqpWHp6ryAEvc96CAMOMd2ZGy=
JEVNMsJfLkz6w@mail.gmail.com/
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Suggested-by: Huacai Chen <chenhuacai@kernel.org>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/kernel/head.S | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
> index e3865e92a917..6ce999586757 100644
> --- a/arch/loongarch/kernel/head.S
> +++ b/arch/loongarch/kernel/head.S
> @@ -20,6 +20,7 @@
>         __HEAD
>
>  _head:
> +       UNWIND_HINT_UNDEFINED
>         .word   IMAGE_DOS_SIGNATURE     /* "MZ", MS-DOS header */
>         .org    0x8
>         .dword  _kernel_entry           /* Kernel entry point (physical a=
ddress) */
> --
> 2.42.0
>
