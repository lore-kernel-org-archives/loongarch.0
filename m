Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65843126C0
	for <loongarch@lists.linux.dev>; Wed, 15 Apr 2026 02:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776220071; cv=pass; b=Qa3TtsePA9hBU05hK7TjYBNDp1Ua4xtPt0bopgbaqS1i/ijK3bwqXyvW6eY1RGgixHlT54XhITTgPjff/pu0GCcvsByMeGz+1s6uLADyzEwDWAx9huBg8UNtgVUGZnIsQmJ9NWNhjWOs6tqf5c9KrLkGm1Wi7Do+/wSbi+E56Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776220071; c=relaxed/simple;
	bh=Rg3JlwOrlQ5XbvGJDFfZ8rC8vvU78IBNAeleJd26Fm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6IL+M5fFKjOGOnT/jusZSjORuhMMgXQPLe09w3y3XBVCwwT00sUhZorDSYsHgbJ+iba/z9e1DZEwDWF3vVMLnfidgyxsxPt/Rt2MxY0AVrvmkdGdasmkepwb10r1s38EcqwrZLMy85Z41RSyGgoSBUzMlmDcuNbTo/7Sesy8Iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hd6mVKvO; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hd6mVKvO"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-470145d7e6fso2258806b6e.2
        for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 19:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776220068; cv=none;
        d=google.com; s=arc-20240605;
        b=PN0gYneko5lL7+uopnv3Lc3xkjvYfSE9Xy5eMzQdHMPeRIsAqJUw+ZvHvbkZ9shdq4
         3Us1P0VAoDVxAn7296k2IHi8kTjznQwZTq1vbrbtbKQX7Rl7OjGHR+LLv6zj3qSQuM27
         DQ1yLaobdb4XKBBHn/As96LqKeXkDh132ThxcJu6JYdI45R9VV7AlFgj4IZYYgEuoAeG
         W+1gAXckaglx0gQYSxel0SY1lSIqS+0GHWGGcOmCTkqdbbZIWK6FnIGA1dSvcl45ehAt
         JBtv9sDS7z3PXFm7CE1SxqH/pzWAWHFQQYmDF5FfIsjRGOyOzLEtYcayF0jJbFaRTMaq
         Yklg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P9QwzqZ+lHxRLuVTrCD+/Bo3+jO92j08BnbVftYHz5s=;
        fh=Q+5VSsfsVZglqTg3iWDGKaxqTRPb9hYIxke3oP0+rw4=;
        b=VmzDjMvDwPtZq4GDJ4kwo4g6UddfJHVOWGm84NLURtbJLYqUUzO6eHP09gcu44/FfB
         K5VXOJq9YJEA0KGHmWmjaJm/fUXZMHnINwznFv5g6YQOEsrzABQz4IpeCDNBOZNRd2a9
         4L4xenic3EIGMJhPJx9ze7SRfBIGpLL7NBvBPUBjdgHKJOX6nnKnnpRIByHCacJr6shH
         A3kzM12pRMJ7bHRwrLZWGmkvHRsueT9RbY3BjyuNHaELRzoTZeShAf/jTF7cUTTvYEfY
         N3GEUGktgiPuS4TqV5/OK8T+m9rXf1urBFockOLS3Erxnm6s1fUcX21pnE9oaZmghlF4
         kEvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776220068; x=1776824868; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9QwzqZ+lHxRLuVTrCD+/Bo3+jO92j08BnbVftYHz5s=;
        b=hd6mVKvOuIzhIiIgkUQ3aJqKQYm1DUph7LvnuISXbT+4F1mecA87tO3CbgxoqWu1X6
         KXZCvumapFaxr+zn6+MM/UvUPLvgUE0BcCZdzpO7dUh944wveczYWOQMG4c+BWcJ2FoG
         7yhcZpINIJlIQ4PXinUKTWflL/tyloVG2buKjsCXwH2XcKnzHf3jEYY1Mk3H4elhaQDr
         uIO7s31QiJ/BdabPtx/NN0IggNaIaoLBvj1mkp8PioGerTEYyEHFRCc9qHIFv/jZThQb
         1Felkf27pWXyiI69NbDtYOxVtrQdbhwONzRKLnkfNYkJsJVL1NFG8RYJsEJqQHkQraOO
         AhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776220068; x=1776824868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9QwzqZ+lHxRLuVTrCD+/Bo3+jO92j08BnbVftYHz5s=;
        b=O5jf4DNxaTsi6nE9CXYFFb9rSgJH80C4BZErTB3KwZ656CWPJ/uuKk9PkuCsjXVXyM
         gvdOC6Tf1ip0TGWg37Vp2LLXonPQDI7nkemhdjTapdST7aqUy6Se7CkSJ7Hy++12nubU
         fquPiwDa52sYVrh6PeTSQjjoEUZQmBPeA0A0N3VtxON0y03N/VCI/0KsvpKRUXANHqOs
         Onz/xQqzD3DZoeQjhjX//5jpa/94WDeq91wWQ1TYUqCbnhXuKEjKrtbc/OBPrRcPqh/L
         ndS9Up0liOMgzqrqc9G5L+G045NKqUtuc37LawL2maBJcRRQSkmQ/WWN5aJMe6vI+ETB
         o8aA==
X-Forwarded-Encrypted: i=1; AFNElJ8LY8MfB7fs8m5QPspvp6zeXKEk2/rtePDpDwAeCHUp04TDLKWNlYB54cqVgm7mpdHced/MOJtSMhM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyW6nb3KaQxKPjb/+75g7f/jTVN+NNCXoee2f1/iDMrgsFyeD8b
	pBMW5Mvc9ePEo5+AMrQI97fo3o/Ahw4fmKUzjv6M7owxEzH0zTXbpIFOP4MWs4wRrLpGup8EZhq
	IavhU045Gt8GseMyhqYqfYwhM8l2ZLPM=
X-Gm-Gg: AeBDievDISCYtTGDI0fjqlw+gkGld/SgNJpFObmRjRRvyOvdWXdOS0KkHcLZQSYypkt
	XS8DkdJhzfSfACetXhhE3s1/Sc5yNvVCAf2eiJtEiMRkZyk2gJizxDIcTDWSc6gsBO7R+if1zKG
	RU6OOJcS9wBoQ71eNx33sh76a49GRzz2Q4CJiUWe3eq1Hvmp3E0NCVzC+TX/8aGnIOY4Tna+j3v
	cWe1s4u8jsgHxIt+KzFGNaI9yRnaJp+ISVtaNRLIy6Olte5q/2jQWyQXv+HeIimWQOCDOwhG8Rh
	oENZGS/yg8u4sU0NHw==
X-Received: by 2002:a05:6808:1c0d:b0:46a:6d33:65a8 with SMTP id
 5614622812f47-4789fb11b45mr9672786b6e.32.1776220068530; Tue, 14 Apr 2026
 19:27:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413040506.26640-1-yangtiezhu@loongson.cn> <20260413040506.26640-6-yangtiezhu@loongson.cn>
In-Reply-To: <20260413040506.26640-6-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 15 Apr 2026 10:27:37 +0800
X-Gm-Features: AQROBzCWeMr501FjNgFKBxyyGLNQVfp1RmcgcvkIqZvV0x5R_9jReZCjhCbJTzw
Message-ID: <CAEyhmHSoY9Pd+XMdKCUmv_P9xUm6A9VeY1UnXJNQnGwz8Rhfvw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] selftests/bpf: Make CAN_USE_LOAD_ACQ_STORE_REL
 usable for LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 12:05=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> In order to do the following load-acquire and store-release tests
> on LoongArch:
>
>   sudo ./test_progs -t verifier_load_acquire
>   sudo ./test_progs -t verifier_store_release
>   sudo ./test_progs -t verifier_precision/bpf_load_acquire
>   sudo ./test_progs -t verifier_precision/bpf_store_release
>   sudo ./test_progs -t compute_live_registers/atomic_load_acq_store_rel
>
> it needs to make CAN_USE_LOAD_ACQ_STORE_REL usable for LoongArch.
>

rephrase it as enable for LoongArch ?

> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---

Other than that,

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

>  tools/testing/selftests/bpf/progs/bpf_misc.h           | 4 ++--
>  tools/testing/selftests/bpf/progs/verifier_precision.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/progs/bpf_misc.h b/tools/testing=
/selftests/bpf/progs/bpf_misc.h
> index c9bfbe1bafc1..19f0bf44a9e1 100644
> --- a/tools/testing/selftests/bpf/progs/bpf_misc.h
> +++ b/tools/testing/selftests/bpf/progs/bpf_misc.h
> @@ -257,8 +257,8 @@
>
>  #if __clang_major__ >=3D 18 && defined(ENABLE_ATOMICS_TESTS) &&         =
 \
>         (defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) ||  \
> -        (defined(__TARGET_ARCH_riscv) && __riscv_xlen =3D=3D 64)) || \
> -         (defined(__TARGET_ARCH_powerpc))
> +       (defined(__TARGET_ARCH_riscv) && __riscv_xlen =3D=3D 64) || \
> +       defined(__TARGET_ARCH_powerpc) || defined(__TARGET_ARCH_loongarch=
))
>  #define CAN_USE_LOAD_ACQ_STORE_REL
>  #endif
>
> diff --git a/tools/testing/selftests/bpf/progs/verifier_precision.c b/too=
ls/testing/selftests/bpf/progs/verifier_precision.c
> index 4794903aec8e..6f325876efdd 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_precision.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_precision.c
> @@ -75,8 +75,8 @@ __naked int bpf_end_to_be(void)
>
>  #if (defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) || \
>         (defined(__TARGET_ARCH_riscv) && __riscv_xlen =3D=3D 64) || \
> -       defined(__TARGET_ARCH_arm) || defined(__TARGET_ARCH_s390)) && \
> -       __clang_major__ >=3D 18
> +       defined(__TARGET_ARCH_arm) || defined(__TARGET_ARCH_s390) || \
> +       defined(__TARGET_ARCH_loongarch)) && __clang_major__ >=3D 18
>
>  SEC("?raw_tp")
>  __success __log_level(2)
> --
> 2.42.0
>
