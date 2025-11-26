Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEFB4C9D
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 05:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764134651; cv=none; b=uKpQDPgckNe9wK7B8yHd/uNuwx1Z5XvMMraZxZIwk561SjmPZeTycjY3fZOwXUgn3OXg7Q+/L1jyU33iqQaa4shmDRqi52XQsbZJlFwMIkWdRhaXRONBlyT9BOl/ad07Q87BBL20uFPHXjDdXpUqc3qNKGlVQRkKUYszXcxiWPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764134651; c=relaxed/simple;
	bh=ucZ8SqyZpR0u/75bLbTUOyl2K/83eHsrd2GcTSNZ51E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tY49iWyCkUH/5REHPuFxdAgr0XNAwmPs7pxTI1IVQNcXsTnRfEnNnKhtf3uIiB8oB3nH18dSgyppcpf/5Z/6qynebASgAs96pChSXwsdTbIQHJaPoM/tIGuBF7Q3LytDtttTWD3ePgFpXrkBx5eF7C8WwA3kMy0x18GakYggxZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfttG+P4; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfttG+P4"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3e80c483a13so4668676fac.2
        for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 21:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764134648; x=1764739448; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJmssXcTUiwC47+4RmCEkjvPSQhPvpEpzrnFQbxnAzc=;
        b=cfttG+P4dAnDQY3FGIarJMk3XohD4PkdTAfD8nfL5IE/BYFol5Mpl3+pnnZGDRhgWA
         qrY+MHrH8ztYZ44kvm5pj5joC8fPOfOshwkps9zLGUPU1tzAK9zEobnTkgeRqzDOgsDP
         EQP55NzfbTXvzr0bubjnzEx7b3XFj0FJi7aykr8dKqxqLu4DgbMI67KStkfgEIDR/RHs
         1lNGLKtceyQ2081uIwbexAvqhu5mHjunNoHE9p2b+EFJYPFDvbphoel91y/Q2Wz2p7ft
         1x15PL7g0YgRn6YBm/nOZpUVgEa/97jXmu2QQjg7dT7JZ3Z3lUZvgxoIVkkLsKozrO30
         CTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764134648; x=1764739448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJmssXcTUiwC47+4RmCEkjvPSQhPvpEpzrnFQbxnAzc=;
        b=kOqsnCHBH7j3Z0HToZp36ueD2mwpimlGpH46+7ypjPTSJvx/uxZqbmnGwhtnbbQ9o6
         iEb8ZtOojImPn2OPEnVKzrwSsF2UmlcPcwUdNNgbzXa5MzUix6XE1VRw5DqGjkLuH4i9
         eePgis4fk63fe0jIkeTp6qRba5eI5vg+ahS7jZ8hYHBsOn56KyI2AvBI8Oe6urwT+xuU
         QLzlv9UoRjJN0TpxVo5htzBZ2Aslr1iSLaEVVzg6RybWpQayi6C86N8uGryFXppchb3F
         meSnpYwL3OHkBCjsg7m6LyclWTFibB+r2OXBI4++nYmtVEk883N7Z84a3fZu6VPvxrCu
         u5DA==
X-Forwarded-Encrypted: i=1; AJvYcCWj9OpklphiP3KKUSSuaK6iKV5OmBDTed5kEOG7sg8I/J/5wcCo3XIDXnkfjCEc9mcX9wBxo6K33Sg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6qO4KBOvcOPVXhCWxEvoBxB+g7HZHjspwuTLd6INrUX+KFnd8
	GWvi/0u2PA9gv/mAIBMJvuRIPTqivYZ+iRum/tYPcd9qW+cz24aPASfpMn4oGwiI+FrefcHTsOf
	yiYGSZM4WZRkPvYL7M5aHp1yAGSSKW+E=
X-Gm-Gg: ASbGncvuAggPLmxkrvK2WxntztqMe9nBq5+qHt9CbXZartObQ5sMwbOl9Jp8F1tzHhO
	GDFYttQXakmfcD/npfGOIlUqcDGrorr3tMJeh92C86HEvjb/83qF5TaF0ualU+VWDst/oWk3DtG
	SrJXC1c9jfg0XrbZMgulg5FuoSGxsoY94AdpGFdPwNPEJzRnPNe9u9YO/Q3eoHPy/qEnId/AM90
	Wd1QmSLcuZDJzJLVbJZvXxC4YTWSv+2UPVZNDqdtTuUJXIz9VGBv/tagTKbkIEWj8j11Q==
X-Google-Smtp-Source: AGHT+IGyBoWvqEMRExwxgNtFIZHGCpK0HONMbTUdDQNr/aQjs6BB01Y9AUBIZqi5sXgneclYAQebL1u/8JYlyNO2Wyw=
X-Received: by 2002:a05:6808:c228:b0:450:c6a0:3f39 with SMTP id
 5614622812f47-45115b1bd89mr6314354b6e.58.1764134648576; Tue, 25 Nov 2025
 21:24:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126-2-v3-0-851b5a516801@linux.dev>
In-Reply-To: <20251126-2-v3-0-851b5a516801@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 26 Nov 2025 13:23:57 +0800
X-Gm-Features: AWmQ_bl1j2TMfzdRDufclq2wkg_W8-73jklzBRFZGeo9rC7bibNCtZXMpdORN18
Message-ID: <CAEyhmHTJU-OUZFA5Sdiv+mBwQpfq5CZp5kN9HVKRqbQzqRS66Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] LoongArch: Add 128-bit atomic cmpxchg support (v3)
To: George Guo <dongtai.guo@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 10:06=E2=80=AFAM George Guo <dongtai.guo@linux.dev>=
 wrote:
>
> This patch series adds 128-bit atomic compare-and-exchange support for
> LoongArch architecture, which fixes BPF scheduler test failures caused
> by missing 128-bit atomics support.
>
> The series consists of two patches:
>
> 1. "LoongArch: Add 128-bit atomic cmpxchg support"
>    - Implements 128-bit atomic compare-and-exchange using LoongArch's
>      LL.D/SC.Q instructions
>    - Fixes BPF scheduler test failures (scx_central scx_qmap) where
>      kmalloc_nolock_noprof returns NULL due to missing 128-bit atomics,
>      leading to -ENOMEM errors during scheduler initialization
>

This kmalloc_nolock_noprof() was introduced in v6.18-rc1 and has no
caller for now.
Why is this related to the sched_ext failure ?

> 2. "LoongArch: Enable 128-bit atomics cmpxchg support"
>    - Adds select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE
>      in Kconfig to enable 128-bit atomic cmpxchg support
>
> The issue was identified through BPF scheduler test failures where
> scx_central and scx_qmap schedulers would fail to initialize. Testing
> was performed using the scx_qmap scheduler from tools/sched_ext/,
> confirming that the patches resolve the initialization failures.
>
> Signed-off-by: George Guo <dongtai.guo@linux.dev>
> ---
> Changes in v3:
> - dbar 0 -> __WEAK_LLSC_MB
> - =3DZB" (__ptr[0]) -> "r" (__ptr)
> - Link to v2: https://lore.kernel.org/r/20251124-2-v2-0-b38216e25fd9@linu=
x.dev
>
> Changes in v2:
> - Use a normal ld.d for the high word instead of ll.d to avoid race
>   condition
> - Insert a dbar between ll.d and ld.d to prevent reordering
> - Simply __cmpxchg128_asm("ll.d", "sc.q", ptr, o, n) to __cmpxchg128_asm(=
ptr, o, n)
> - Fix address operand constraints after testing different approaches:
>   * ld.d with "m"
>   * ll.d with "ZC",
>   * sc.q with "ZB"(alternative constraints caused issues:
>    - "r"  caused system hang
>    - "ZC" caused compiler error:
>      {standard input}: Assembler messages:
>      {standard input}:10037: Fatal error: Immediate overflow.
>      format: u0:0 )
> - Link to v1: https://lore.kernel.org/r/20251120-2-v1-0-705bdc440550@linu=
x.dev
>
> ---
> George Guo (2):
>       LoongArch: Add 128-bit atomic cmpxchg support
>       LoongArch: Enable 128-bit atomics cmpxchg support
>
>  arch/loongarch/Kconfig               |  2 ++
>  arch/loongarch/include/asm/cmpxchg.h | 47 ++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 49 insertions(+)
> ---
> base-commit: d5ae5ac32615e4af729f0610fdc11ff4f4798aef
> change-id: 20251120-2-d03862b2cf6d
>
> Best regards,
> --
> George Guo <dongtai.guo@linux.dev>
>
>
