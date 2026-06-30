Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1DA3DF018
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 18:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782842793; cv=none; b=gNjx8ws98l2aRVBZQfSwSA2KiAbk0PYKGRgfDMhiyfZDeGMsYW/V7HXl/kU9yXKYi9zREk9kmgeqzjD7x6v0fm7NYmskfp3CVEKh3Ggz9quC6XPhFI3MvR6H4pw4GXfpRTR9GeBrSp6Q1zJIo6Zr5o3tWUbJ/gdZtSpQaMJuGw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782842793; c=relaxed/simple;
	bh=CCydaf8iCxcowGdrabRK9TAL0PXl8sDl0isd9KqbIFg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=HalQiVCtjdVh+IyH8pQ12CgnxtrKPtXloy+XHXvMxpAB+wGIIJE3tXBJwx4bZAxz9uG5SuHm9vDCZIuYgQPZ2xIzgew9eIcmtAl3J4hQ/8mIewm7ViwzAGuyfOJ4HZ9ZZ774G0yiMDXJj12FKEbhqYYycWlJUlUINsaCauJQlvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XP9HkjdJ; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XP9HkjdJ"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6a192afad7dso482523eaf.2
        for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 11:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782842791; x=1783447591; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CCydaf8iCxcowGdrabRK9TAL0PXl8sDl0isd9KqbIFg=;
        b=XP9HkjdJlB4/1J1YXz2QVMazNjqAr75JJGw08LinhvIoaALWafBM0OYbGsolCPFlMB
         R0cVPfNjpWuhQX8X/XcInyFlEXE+8gO6WTThehLRi1ESsOT/+8/5JRfC2Ps8sFn7DSsK
         sVfpC+Yuqq8ccL+WstuSQUh+qmgBO4+Mi/ayBttFrxDpYXQJu8e1OoEpiYxQLq7hto73
         ujDrh35uFnF1yFfqsWkTlivEaymaKLrjC2c+16FRXTC62L71UZ9N3gZj+j+fQvLfLd7z
         vWgMT2w25WcnOUjLhbUwrb2XUpyBwiSOC1+r/+NNeOjXWSQM4uS0kPDXXYbAjZyyoAIK
         2Z5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782842791; x=1783447591;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCydaf8iCxcowGdrabRK9TAL0PXl8sDl0isd9KqbIFg=;
        b=psyIfUBvDGIAh04ruvByevTfXi4wvspI11Yizz36oaYiHsMp4qu5OQ7tJTTLvBcmel
         SJkv2y5uj5KFcZ7jpe4aIPoIjtIQgCDNvaYP5/E+RCoCyyjoOnHal0g6DQx47E8Ceag8
         33uLtg9shkz15lXjCfp9nyDNC7kzIAgEsUUcDsz7AXvRPsjspoZ7p4rmvhmAjz/1p9Zq
         QXktVfnzdDeC94MxeNAi+/dl5Vub4K19bT6e6QBbn+lxuQebIVNvfYNy56YdRemsrpDu
         oPD8gk+wCZv30N7J++h8fHKyGyMwVcSolfdi7QqyxTeMnDiMoISS6IavRacwUokdd9vW
         hhtw==
X-Forwarded-Encrypted: i=1; AFNElJ+u4R4Zold/7SG2mWSSnEEALNPpya2jR9wDmhT4GAo5ykVCRq5ks18id23UR5myvhR0CnQtQbtTVdE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoBWEhbSUcIYm2G1fJ+odrz5uKdDX4DbDLwwp9dk0/bKkvSato
	Gcw5S5l2LpO8SpujpwNT2M97lzOeONses1fJyOmhIy4VmlsDcnKmRvbS
X-Gm-Gg: AfdE7cmTtmr6OYKpWomlhGrkm5lLwqR0rsKfgyZb8YRtCz7RBDUWHs72EsTdzMWHCT0
	NWatD0ix6AcZ+SofnwJ7w3ShaCgh268KtGd5dmxb8ZlIrx0K7m5C8wuRtFp+TkQRyE+BqAeZzYj
	AJqEIjGg6QRGYij0o+6c0c+xRKAdbvhTGNIBtnpxEXF1fxBfpzSN3/23/ETaJfKWawa5gCh6yHH
	SK5fhhuDh4VvSNwr5Tg6U4Sn0lmBwybra2aYieE6nnjW2C01GRvLVd/LgswCdOMZaJsN5uMa6LR
	uLQmQoDS7BKYjBHKpJtzc180zYHfu0nokrNujbuKIURQ36h2XBAlYyrpIvO1p4VvGCyA/hccL2N
	iSmaYSXm+JkPRO5tB2F0cOwkkDSQv13JvXqY79BuSa00d0EzjgkO99QvNWXeqLzxod8pr8px/iQ
	J6gEuJfwplRipsePX/AbrRnLEcDT/m+psVwbuOSlDEZGDriH98hJ1GiJSHSugI22LUR2WKWLRxh
	KAyiMJxPaxiavePPg==
X-Received: by 2002:a05:6820:52d2:b0:6a1:50eb:d524 with SMTP id 006d021491bc7-6a1893fcc34mr2741079eaf.69.1782842791572;
        Tue, 30 Jun 2026 11:06:31 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:5b::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448dbf813d2sm2773410fac.14.2026.06.30.11.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 11:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 11:06:30 -0700
Message-Id: <DJML0UYPUL9U.P5NHVG4E32LW@gmail.com>
Subject: Re: [PATCH bpf] selftests/bpf: Skip libarena when the BPF backend
 lacks 32-bit arena cmpxchg
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "George Guo" <dongtai.guo@linux.dev>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>
Cc: "Eduard Zingerman" <eddyz87@gmail.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Mykola Lysenko" <mykolal@fb.com>, "Martin KaFai
 Lau" <martin.lau@linux.dev>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Huacai Chen" <chenhuacai@kernel.org>, "Tiezhu Yang"
 <yangtiezhu@loongson.cn>, "George Guo" <guodongtai@kylinos.cn>,
 <bpf@vger.kernel.org>, <loongarch@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc
References: <20260630025809.74043-1-dongtai.guo@linux.dev>
In-Reply-To: <20260630025809.74043-1-dongtai.guo@linux.dev>

On Mon Jun 29, 2026 at 7:58 PM PDT, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
>
> The arena qspinlock pulled in by libarena (bpf_arena_spin_lock.h) perform=
s
> a 32-bit atomic compare-and-exchange on an arena (address space 1) pointe=
r
> via atomic_try_cmpxchg_acquire() on the 32-bit atomic_t lock word. Not
> every LLVM BPF backend can select that operation; releases such as clang =
19
> abort instruction selection with:

Sorry, you have to upgrade your test environment.
We won't be disabling tests because people still have old clang or old gcc
or other older tools in their setups.

pw-bot: cr
