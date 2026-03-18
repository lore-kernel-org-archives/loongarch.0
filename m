Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8A236493A
	for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 06:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773814601; cv=pass; b=Fq+jzwblxAkBqc5qv7TJYKmi1EZtmTyRBuxmHFxOAsmw8J1IHrcTkQsk+5T3xhe2ZLyrZ/oQci8zhMo3muTEoOFzCNHyMKPPbsrD7K2ANujijwIkSb40WItY4hfiYYY1UB8SBOJ9kc2NfhBHPbB/L5rhcV54HoALNAXG6fsQxag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773814601; c=relaxed/simple;
	bh=LyvuvQqufknbMfPTy2o7n/T+OqohBBDpzWX+jX0Ni6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYQlt6B3tQVCTEjGziBmH/WelTxG+Mj0Qv8LvyHY4DlYahr1r3ewkKY90ZNpKBbInuzNBn5AQlXXvM5SygxS95BqgW7UGVcItheTphgprs44P8ViblKujQyPUVwNz+LVkIwHdA6zavj0YP9DXseDz4Zc4ImDK2pYoBa3bP6+Mk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wu+OVyxr; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wu+OVyxr"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b97f9587e6eso50398666b.3
        for <loongarch@lists.linux.dev>; Tue, 17 Mar 2026 23:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773814598; cv=none;
        d=google.com; s=arc-20240605;
        b=CwD6LqCzHn0gGXgWD4VXRkVWGqXidJLYgHgtytZxQpfb/YqoNcp7oEpJXe5G91he79
         G0VdQxUciq+md4+4Y0CTvwlTUSBS3AjhuWIaVrZUEXOurYKl7UIou3SIl14ooT3immgC
         2WXiZhLo7jXYoOy8X+J+Zx/DouqcJ9yzaYT634REvpU98ZstjbFlTE0AvG0P9lmXy6qT
         O2ePKX3QEQBCvUU26MEiuDnxldA93QHXSefYWmbc1Ny1RlK8WOhO368+UZVZ7p3dIHuw
         kyJYo2cs/evDugdBQBOxl5aKKgKb0bVMlNmlA26u0r3UUkmSdTvDr4SIsxRbjFxWi9xg
         Okjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        fh=sER8Skzs/dJMeNCrBBJzGNhqLeHwGZhcu5bhcd7cx2o=;
        b=ONQWR7Gc9DjV/ADdh4W1sXoviPqCttpcAo7ppcTjZwJBOdU80Q8XD4ShNAo3R7/U5t
         mNZxcpmMZFsVJGM5t+nJ71Q7s7F2S/6XQ/O9mtZHNQW+GT4rjamhVOrnOSWEgtChWdu/
         4UJowowjcLoc7WOYi6Mbx1IyQO5f1/qHUHLnnyuOdr7ipKluocLtb2PYGwmZGDun1Qtv
         b/T70Ptpyxu/WmujdyjFaXj4mOXrFzgevoUNPZD4gvF072TfjRI+QW0TKiwKzJix+nPt
         Iv4J3/8rBwfagclYg+6mxnVyM/Sv/sLyMfkIXte0HMnWxugZ+w8uKOT9mEM0t28I52fx
         KqZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773814598; x=1774419398; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        b=Wu+OVyxr2JUnqHlI1C9bxs/MU9n4vzNGC1HBwE8knD05Cf/uz+MVNJ5XFfdjBmD9iO
         nUqs5m4f8H/m9hpuN+2zl0UEAxZvd8TQtNXsY9m8Xd23HY/CdSU1S6b5hKv/OK6f6czA
         HfkZTk54BSeGzwv1Z1lr7r71d+rLK7z6fw1h74za7lgD1cEuahw9OvglbbPy4Xsy7BBZ
         RzRcRRyUqJdTxN2ldK4EW/aJSkE6V1eAOrTej3AG3dPu5TefCuirDjMJnqwVKuN/gb+u
         e8tsY9XbTwztBKFuLEzXTNzLogvwaBy0EPNAVs1z+kqh4b8ljZXJgQg5qLweuNlCBMaC
         vhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773814598; x=1774419398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        b=OFgeHYC5R2mnqscAsztZunZazAemhEpBmv7LPS249xvClcwtDaVZwDnx4Ym3hnMmWc
         3bLd+pafH1GbJluAkyVVaDUXTZc/AGYDfffstTopiZBd0qdkEbdOb7hCn6qzpD7tGTB9
         4mCMacu68f0umeaBmAsve/+5JIkcAsKi8n3Z17j2nPIWS0t1mLta8jOilA879e34DS7l
         KmIsBLv80EFB7ccrpUhbPrYrME+aCC6Vyh4o37aRVovv9X/qWUUOSD3/CrmTL7yuGCr6
         0PscRuGxmEPvAfoxB9aKdW8nWC1BT+3tUN3jYL4217EAXUgpLtkDytMhohgYOxyxUri8
         htiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEUdHqOkHjP4gFNeDnUD4roerQIGB9cb2GLCZZWW2JfYO8DgCIm02pKGZeyn/EuPZ1Z1rJn6nqKlM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0LB1RmcSfktesTDCdg7/mboQg55gogH1W5DhOW49+9h3452ol
	uklOdxHPYrLXNDqFbxAtmhNFoXdjB4jdIBHkpbH99qhwQqcn26CCGspIfuHvxc6V7GrE1kYquoL
	BI/VylqAUDK+vWZqbZZb3uu2tuVslNxY=
X-Gm-Gg: ATEYQzxDM5kEvOdUx477hlsqONTmu5lsBY/dQ+2sSgHPpQjLTl8rvA0S7Jo0/yXD2Kj
	goZfv5GBHsA0aCBQoSa2fpjv/EdR/U2a/a9uUQsj7FCbfrqZ+VhpMOifdq5MCrD2nNAY/bjjD/U
	vlPs9Zvaq/g2zxrHxKNyyn5Suhgmz5SUl4hWFbA9rlgOHJ9eS/GfhmYs99tp4jALFGhtWuY5tLx
	4u6mFf2rnB7WVqEBTKIL5YvmTpEzvs0s1I7T/Kgy2qidZywmFtcGb8whPBFnggakvjWSYhaKd0U
	XAHsSSwy06MBOAu3ZjqpC9lfq2528KDEZ1uvOIaqj1c0KYscCXo=
X-Received: by 2002:a17:907:7b93:b0:b97:cc05:61b9 with SMTP id
 a640c23a62f3a-b97f4801ab5mr133040366b.15.1773814597747; Tue, 17 Mar 2026
 23:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de> <20260302-at-vector-size-arch-v1-14-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-14-a11f03ba2ca8@linutronix.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 18 Mar 2026 07:16:26 +0100
X-Gm-Features: AaiRm51Xx89jeaivgNYAhMk2LxpIu3kD6j5N4SuQDZ84WCnP1EAzJIW2dMNKGiE
Message-ID: <CA+=Fv5RLtUPp9BhXfFEUk3roE3Gah0iUamDEZ-MXCNM_xKm3PA@mail.gmail.com>
Subject: Re: [PATCH 14/15] alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
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

On Mon, Mar 2, 2026 at 1:32=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> There is nothing userspace can do with this value. In the kernel is
> always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
> userspace and also changes from time to time.
>
> Move the symbol to a kernel-internal header.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/alpha/include/asm/auxvec.h      | 7 +++++++
>  arch/alpha/include/uapi/asm/auxvec.h | 8 +++-----
>  2 files changed, 10 insertions(+), 5 deletions(-)
>

Build-tested on alpha, no issues here.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
