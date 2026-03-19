Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D820B374168
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930485; cv=pass; b=gZrWsO8Tpsd2KAnxmPd7zXhSBU97baXvgBu/UxeZc5NCcQztkr6BYZLDf/VlwvpTKvRTq74I9IhAB2+FqVE4w7FQUcB4+107w+Cq0Je6Owpxf+bGvzkfWY5V5HjmC9TKxzlaTvh+7mxfoOyehS686dunYcWYgaDe93K8sd9ae1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930485; c=relaxed/simple;
	bh=x6wZk7AvpBRTPYt5th9R3ycT2p5XdAgtnR98fAb1EOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=heMBU/hdezNyijRaEaR/wztx6Z1YoFQaq6gcbbsARfvNadXPldAQkSvuubiyn7MySEcnHnGceuRgNsD6ZopSNAj0+F2tS1+N00MvpQxGCBk6/amYj1VtPeAhN2YqGD7XBfEldlKurUdaMax+Gohyc/lhZUdoCyRpgyS5/kAKp0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qtc5AYKt; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qtc5AYKt"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-662b5bf4b10so2003306a12.1
        for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 07:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773930479; cv=none;
        d=google.com; s=arc-20240605;
        b=kUPVw9mgbOxrSypwP543yrZCmx814uj78OwHQjv/nZJ5m09Xc3/VkG0QsoSXuebCCh
         7/GDwpNVc/3p71VN/uwOoLgOwG4hEo8sTezjdNvdV8PbDjBuPSkDOCfp3frUlZK3nlVS
         JEInut56kPKbZ+cQgsxKN48vTCHIAATvfIRHH2CWVO6awT4hurFK+O28hbThKSIiJXMb
         /Ua0eCOqESMHdV+tftNIYx2AYQP5FTLNPLJL4HGuhLsJjS09+v4yJFAwm9GG6Dqn51Oh
         3+td8B3BeCiKIquIVy7YVAx7Vc3yu36VzBvcR6CEeCtZVNgbKHipeqGZX1P/eM/rWrG/
         BrKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEYdsi/UQnV1ulkUEVFM3uerucLpRLXH0M0xgNStZdI=;
        fh=ge+c/WI8aSP9Cn5sL9zVZfCiyvqqXo1mBM3MUHDiRNQ=;
        b=MpGhEDVMgnv6wtYST867oFBOHbpu9xpDw0hB7wdDxxly/d7anp0Lm1tExXFBB6RJhL
         /pVxqx4C+s1gIwemVNfs6VAw++w4n2RbLjKrvn4hoS95GckCo+2FzrrTioB84Ii3GIrm
         LGE9RuUCyCgawvvphLSCdMiSPb/poKuvh+Z9l1H1W6CnvP1zlkt0gBQNkKeSSEViycEB
         55a5JUgdhXdlP9u9/RuRlgyJAaUuKCGH6g5IvITYZ8psxEx68HXlI3slqX9Joko+oVN8
         9Qtlu1SksoCaHJTebs+siASSX5SX534NwhljCi04gXIfR9UHLU2UpJk+8k28Or3heU7q
         Bgig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773930479; x=1774535279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEYdsi/UQnV1ulkUEVFM3uerucLpRLXH0M0xgNStZdI=;
        b=Qtc5AYKtiT0qkm46oDdFqhd8DEQ1TidrU47vtaFKAzxT77qdsO9BtSmHRbY+CZMyRw
         XVijdRLuFs1phaP5L6XUy92X7yEAGYQOfa+f9goQEON6yOr9zatbgnZ2Ch98/nNDNRri
         qaoIJvoDH7R5A6sS6CENVX/0/944aoGxrZHz48mG0Wx/pkloAd+zyQso6iFsYYUN3mfB
         Eps+W5c10lbKrEzeS+LAwfYuFkCNY7bwssQ30r4sL88J41HntXmZlPTypPOmzANajv5W
         5wkK3lvsH/zIHUsYFZGFF0+Mj7lSeRwQcEoLMgrQTKLLYBgre86DKMAVu1MFbyMAjWxf
         0C1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930479; x=1774535279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEYdsi/UQnV1ulkUEVFM3uerucLpRLXH0M0xgNStZdI=;
        b=GetC6/UJR4c/KB3l1qRkzTyjhcMdLfIG3y3tVy6BWIPXDIgR1qBge50dWAaC/W4P8/
         7uhxC8WvWON73pfLpJoJ3AmN5p/K9iedBxDhe0jm00S8V7kKWcnUGzE4hTN4lrM3K9qt
         i5HQ8FmXIq0mtzvcvNMQuyH84oKJEZr9BchqtqJm78ePGlu+p6323spru/RbYLjWcTsH
         VirirqX6eLuIEEvhYNb+5vZX/xHIWlFwcswX5C6q+T2O68ckj1ohDLB+57NEWak2wQgO
         gGkfF5vFBk88wm9gc0FwwxdeP/hkR2J+a74Qiz7kAZGPJFjW9k/KVuv6Pql3b/BRyQ0y
         x9WA==
X-Forwarded-Encrypted: i=1; AJvYcCXOE4JkVYVccCQCPF7JaJ+tr+6ZIryGzKhB58s5fc0iHZo9Jk/gw2qHWphFoQRCpKSCaAjt/dy49nM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz6U4T1uewhoxZBwCTS6aliU2E96DujSYYB8p1iiykPGQQOcYJ
	vJKCDwnjBwhGdmJNjVtvcJTRnjL+zkgtPwnLvtUgKG1ceoetdhn6lgLyQGkJ9eBlHE9syRFdWcD
	1MoTUeK5fBd+aFJEAc03u9Pj49I9c7Ig=
X-Gm-Gg: ATEYQzzym/Ez+C4bJtYfsZv5HJCBqcAnxS0k1Fj+v3uJ7WZZ0A5GNpxsoYaXbHeM0iP
	qq9XeTDgVhZXa2crcMf1ouNwNDCK9EECasUklPzvh6N6UBR22e39NYRUOsdbCxIxJzXsFBegPJE
	2rAbvO7s/2xT5KB1JyHBbjmM78F2FFUIHJe2tyx7u+3xNDvrO/D7P39MQcXG67i8gEF0EVeaLiw
	TT2Vc/GohkYjPs0VfB35nNAZGGOIKy2+bpflqjVheeHTe0/Eg3pQ3YiGWhBpPgC9HGGCYH4xzgZ
	B3sVZzCxPQ==
X-Received: by 2002:a17:906:ee83:b0:b96:db93:5d0e with SMTP id
 a640c23a62f3a-b97f4ab7799mr545864466b.41.1773930478856; Thu, 19 Mar 2026
 07:27:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de> <20260302-at-vector-size-arch-v1-7-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-7-a11f03ba2ca8@linutronix.de>
From: Andy Chiu <andybnac@gmail.com>
Date: Thu, 19 Mar 2026 09:27:47 -0500
X-Gm-Features: AaiRm52wQD6uRKulnt1Y_ioaRFL-b1bqEKDLHZMA0LYwV13CAWHAV79Bf5laR-o
Message-ID: <CAFTtA3O74BTJz8d87CJFQpa8Sub_ouKyyAB8cTXUxd=BnUzS7Q@mail.gmail.com>
Subject: Re: [PATCH 07/15] RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 6:27=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> There is nothing userspace can do with this value. In the kernel is
> always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
> userspace and also changes from time to time.
>
> Move the symbol to a kernel-internal header.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Andy Chiu <andybnac@gmail.com>

> ---
>  arch/riscv/include/asm/auxvec.h      | 13 +++++++++++++
>  arch/riscv/include/uapi/asm/auxvec.h |  2 --
>  2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/auxvec.h b/arch/riscv/include/asm/aux=
vec.h
> new file mode 100644
> index 000000000000..fb4233445276
> --- /dev/null
> +++ b/arch/riscv/include/asm/auxvec.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 2015 Regents of the University of California
> + */
> +
> +#ifndef _ASM_RISCV_AUXVEC_H
> +#define _ASM_RISCV_AUXVEC_H
> +
> +/* entries in ARCH_DLINFO */
> +#define AT_VECTOR_SIZE_ARCH    10
> +
> +#endif /* _UAPI_ASM_RISCV_AUXVEC_H */
> diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/ua=
pi/asm/auxvec.h
> index 95050ebe9ad0..0a725f2aa2e7 100644
> --- a/arch/riscv/include/uapi/asm/auxvec.h
> +++ b/arch/riscv/include/uapi/asm/auxvec.h
> @@ -33,8 +33,6 @@
>  #define AT_L3_CACHESIZE                46
>  #define AT_L3_CACHEGEOMETRY    47
>
> -/* entries in ARCH_DLINFO */
> -#define AT_VECTOR_SIZE_ARCH    10
>  #define AT_MINSIGSTKSZ         51
>
>  #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
>
> --
> 2.53.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
