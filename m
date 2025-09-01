Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C04B1FBEB9
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 01:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756691865; cv=none; b=RtkzW+pNrwdheisVz9zmWWIzEItiECY81LFLxODQyXVMjvjJvHJOTzgSUMl0E584OmkhECTYiyMo42tnDUO5GrY0S40UzeEBMdnBn9UPGr6ZghA7tlOv4C8gO7s9uqi3G0p+X8Fm0EpKoXXhPNMAln2VkmRxD2ZVI5MhcbJaO8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756691865; c=relaxed/simple;
	bh=13xyZEyHtmKIBqhuxJv+8+I095v7QVL3CpCVZwMQsX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtCu2UrGSzk6PaNZlf8mqZuN13c+VAsflVbf4/B08p4VXlBUknPIvJ5Hp0hdt9GwOwgbyd2ycKfwc1AKuC6Vf8uiSzCMlJmE8Myv5/8BhwOFzTI6+0WTvicQLXTC5GML0K2gRfkso9atwXxJ4n6qRLiCcLCAA9jOTMqg+BKvN2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zn/4aQRe; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zn/4aQRe"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7455333b04dso2450264a34.1
        for <loongarch@lists.linux.dev>; Sun, 31 Aug 2025 18:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756691862; x=1757296662; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSAvJfEOdVoFarNNb1vovLpi3YaQQM9EDFNwvLn8jog=;
        b=Zn/4aQReKYwqtEFZu24XVmCwt7b0PfFTBMR3X4lj3wCjXQWTFJ4YguZBx8NOcNVLXO
         3aYTzYnnQbI8Ofa9+JZy0SPjN0dx5ftPmRGFK4F8AR96Tt7rMey7xctola6WYEpxIxdk
         BzcKIniPZAkKleVZHFF93Xw77qevPcbKu6CQEb5+4uT9DKhJO3egOSKnNGk6iHKtYHjQ
         SGlX/HJQHjGN/5zrq/N43dGI5b2FnxMLAkW3kCBTzshq9qBKBYFk6istYPpHIT011rfa
         0LidoRoUH+pDP8F2ChVzxMtl+o+rDDUYdvXpnscSRq2GZhd/zg72843HPlBs34TEQ+tH
         XzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756691862; x=1757296662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSAvJfEOdVoFarNNb1vovLpi3YaQQM9EDFNwvLn8jog=;
        b=nqo7GIvCdUvsapnDiAIxKFNM2LVTBWlvSBi0i1dZdOrO+3vKHD2I8FgHm+nHbdgrIM
         4CIVKxpHWMUTLQyLqEHhhGD7gw3hh3PV+H+Q8FClcXg9FCjCVYyOQ+spLJqNFvkFB1Yd
         sQL9r2NI/NjfbAbkJ07r5CJy5hZd/KJ08NOgBsICW0fnbHGkUUgJnet/XCFLySa+8Jsd
         0T9+lvxu2+woLlyd792f3evTweKRVzwGBDnlIf/3lnFZSGBUpFdXusBjIb8jYQcgT/Ic
         +HrbyajXEZyVkqMPfFUt/Wh4qH3TxNEkcjVBj+YLu2PPI5i9Yj4RQuMYmxpwsVVdmFGe
         xxNw==
X-Gm-Message-State: AOJu0Yw6brk4BLjqgdRVmk1ecHdFSamd07f5fpM5K0KfIkbkAuL1EBOX
	iOMpptzYUkqXl/2XNwOYyTwiXChXUrYBGNbS7oOL4DP7qNenI7MopwKI9GKhUfajNxSgYfGqBej
	Ok1PfFq9GT+djrJW8Qw6v4CPa4S7L0gU=
X-Gm-Gg: ASbGncuxu2F1tiRv8BNBe0J3yLHtOaXI9pCnLjh/3+iAqhIak3zfcqmx8r3L/KUBtGq
	4Gv0559w9vlYZAyV53if0kHqwaJRZoauRxkAnVztN8qAOw/USYGqAUN5T6IYWm7Ld053qRnyGDr
	yO7zYEZc/J66VXsMekaWNLjqBWmgxhuqQ8ThT8iAQZPunocYndGoXMVXmHIQ/AZreHS9t5JR1/z
	v5Svn92G0gsaaa+j3KenaBVZKE=
X-Google-Smtp-Source: AGHT+IF6sEhzr4qx1QXzaZN28Gu7ptKWw5Njp0aPWdmtjCbXNWuNyixKuITpp9iVseda2SBce+9anx/sHCCwCZEBaP0=
X-Received: by 2002:a05:6808:2f1a:b0:437:dad8:4942 with SMTP id
 5614622812f47-437f7e075b9mr2408795b6e.34.1756691862224; Sun, 31 Aug 2025
 18:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250831234328.22440-1-hengqi.chen@gmail.com>
In-Reply-To: <20250831234328.22440-1-hengqi.chen@gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 1 Sep 2025 09:57:31 +0800
X-Gm-Features: Ac12FXyABK8D8Q2ySlO9-7WqqkVpUgnpCxVdWTyeb-UQgpABBENHIcX0axup4aQ
Message-ID: <CAEyhmHTV8a=Tp-qjHqMrUtN08n7WRJFGxZ85+eoVNnGiPTj8=w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] LoongArch: Fix BPF trampoline related issues
To: chenhuacai@kernel.org, yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, 
	Jinyang He <hejinyang@loongson.cn>
Cc: loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Jinyang

On Mon, Sep 1, 2025 at 9:55=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.com> =
wrote:
>
> The following two selftest cases triggers oops on LoongArch:
>
>     $ ./test_progs -a ns_bpf_qdisc -a tracing_struct
>
> This small series tries to fix/workaround these issues.
> See individual commit for details.
>
> While at it, remove a duplicated flags check in __arch_prepare_bpf_trampo=
line().
>
> v2 -> v3:
> * Simplify sign_extend() implementation as suggested by Jinyang
>
> Hengqi Chen (3):
>   LoongArch: BPF: Remove duplicated flags check
>   LoongArch: BPF: Sign extend struct ops return values properly
>   LoongArch: BPF: No support of struct argument in trampoline programs
>
>  arch/loongarch/net/bpf_jit.c | 34 +++++++++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)
>
> --
> 2.43.5
