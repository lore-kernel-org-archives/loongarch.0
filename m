Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793764770;
	b=qHtkbKVVhhAbjbo3DaI7npA6XLQsTDzz8tZQ8uKxAuUh/yuJizjOVo86womiUtXrt4NU
	 MsjQT+xnUKmh0yBMI5aQYcDTUn4cqKa1NJ6Omgr/XC+YY2jSrT7p3Vl282dMufJS/zTm8
	 TZyw2iaPNo7xJlhfQJHX0IU3rkdA8kup3XYIMv1zIp1lA5JzhMXE79f6amMd1hRibHC+k
	 9CSUJyHd94O7xKJo8mvG+IjB/BLOcsEflMxHmzzsKLTtK3hR88u+Dbem9WrZSreMQAWWB
	 xijoFHFljBpedgJbljYjdETEFdKpO0W3gJ4CwlB19NvCvRPSQqSKsgTRzTXrucc09dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793764770;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aVD57Vyoa++azfiqBAhfzngOl8QvU9DsGw/NobLJvHM=;
	b=QvorTsAAkJEjIu48Gb9Wx2Q4OwXIS77aLo8YT2bH+pn8tYiAtv6nC7xS/xuAAMNqXbRR
	 r4MgCQwwK5BuhVtauAVEG8bJtCINSoGwxLURm+mgHpVFvqmUbV9N1qV1NvE10aYF8fdhS
	 jp/bmU8dmU0DNaydcRVq6AGMwQGNTK5/butVTeS9wZ7MovgWTOODzEAStmptyOt1SClVe
	 Y3mcUdsjjIYMy2mjYZhOo+2sY7cwRWYVUnph1fgI++FQhMJ1E+Hriml2X+StYxlx2KgGV
	 NCU7GryatG6N5/BTb7tHZ/b+ErB4N/8QhdyGtNLXJ46kBhj52+NuNU99qL5JuitsmZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD94606A332
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 03:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA081F0093A
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 03:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793764770;
	bh=aVD57Vyoa++azfiqBAhfzngOl8QvU9DsGw/NobLJvHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MD8HHl2V9nd3qEjuMbvRrBTZH2bsLxioMX7oFVjfHv6Tesnt0q7hLLNSr/m+49jT8
	 lSaMljX+4CfG6xelFsRF1fxldkH8GVcb5JOkwpvBTB6C904Npj4yaJEsjO6nsYj8ky
	 PiTyHb3iLt9aZhE4hj5wbXMfIg2RSBp5ev3N2fC5Zj1mxwDiJy86cQwRZb4AVliw3Q
	 RwP5uHM1C6vmwTxZCfbm+Pbg1xxqSdX9YQI/nAp+Zkv4z5kDyaFy/li/WcsfKzh4sk
	 2fq9e0+Qa+LlcBpy/2sOS5dBim+3SbmMjvx243pGgrt4PUVTbroGo+xDHS+eYE2LqK
	 T53xBvgdG3ILQ==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so287363a12.1
        for <loongarch@lists.linux.dev>; Tue, 03 Nov 2026 19:59:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy3FPdSJ8n823+j7dpVTcmj3zed51vwrhhz6FMJ89Cw7HRqrTUfXYIXxRWl//8qlKyvawUCZzn+uAw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/olCGg1EafAXfFzWx4hFMK9Yt1OMu/+VFF78y44A7ur+rtJ0Nv
	AjFkVASPKbvmC7w32JcdyYbeXWu4Ab5zilN8RlChmcih28ksFR6VHd24r70/Gjawsy8NWfcpRvn
	8j8ak/YT6bv9AJGqs1y3WKkTZwgfNnYw=
X-Received: by 2002:a05:6402:270f:b0:6ac:934e:a9ca with SMTP id
 4fb4d7f45d1cf-6b4d3289b13mr10634683a12.0.1793764768813; Tue, 03 Nov 2026
 19:59:28 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <2382a0ee-cb6d-4572-be6e-ce3cf4d006e5@app.fastmail.com> <20261103102941.11087-1-dongtai.guo@linux.dev>
In-Reply-To: <20261103102941.11087-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 4 Nov 2026 11:59:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Vse=pKC3Beqhqxa7fqadiGVNqkSy_06HZ3Luw2Pmj5Q@mail.gmail.com>
X-Gm-Features: AclHuK_D5CUCusV0Gl1o9MYw2oMRSISAj8jwmHzHqtDwF9y7DdV5NfyDMepEVEM
Message-ID: <CAAhV-H5Vse=pKC3Beqhqxa7fqadiGVNqkSy_06HZ3Luw2Pmj5Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] efi: Pass KHO state to the next kernel in a
 configuration table
To: George Guo <dongtai.guo@linux.dev>
Cc: ardb@kernel.org, pratyush@kernel.org, rppt@kernel.org, 
	pasha.tatashin@soleen.com, shuah@kernel.org, ilias.apalodimas@linaro.org, 
	akpm@linux-foundation.org, baoquan.he@linux.dev, ruirui.yang@linux.dev, 
	guodongtai@kylinos.cn, kernel@xen0n.name, graf@amazon.com, 
	liukexin@kylinos.cn, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 6:29=E2=80=AFPM George Guo <dongtai.guo@linux.dev> w=
rote:
>
> Hi Ard, Pratyush,
>
> On Thu, Oct 29 2026, Ard Biesheuvel wrote:
> > Can we handle this as an arch table then, and handle everything in
> > the LoongArch arch code?
>
> Ard, LoongArch is currently the only user, so I understand the suggestion
> to keep the handling in the architecture code.
>
> My preference is to keep the table definition and handling common, given
> the potential for x86 to use it as Pratyush described in his reply, to
> replace setup_data once x86 gains EFI support. The table contains no
> LoongArch-specific fields, and only the LoongArch stub installs it. On
> systems without the table, the common code does nothing.
>
> Would that be acceptable, or would you prefer to keep the handling in
> LoongArch until a second architecture adopts it?
I prefer to keep it in LoongArch until a second architecture, and I
think Ard is the same. But this is not a strong objection to Pratyush.

Huacai

>
> Thanks,
> George
