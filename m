Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143FF1ADFE4
	for <loongarch@lists.linux.dev>; Thu, 19 Feb 2026 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771504918; cv=none; b=OKUaLXCS7RToKts3G8WUSruqCLw9XB0hwdxHGWL2vL600u3PIDJSXNanXW2ocC8i7BfYW8+TkjjPQkg0YLM59QQDAJDMpiOa3mqNTD/kuKefSb/8wgJVe1Fl7GKNeTH+PAnKBbtV7Ciuw337ZiXDW3O/Atb2JpKS3sahfucxqe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771504918; c=relaxed/simple;
	bh=WFgEdxjnF8A05d5mgtvj836zAZLdzQveFoZlSYE1Meo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUIKxFqLN9asgBQATxuoVLy3ljG1/dijuzMlN3rN5PYTW2ol6trVkzmpiATAYXI0N6gn3BWKhW2JWZHgmuwqROjy0ZeyHeqxEM02tej9e/IObV6SBjx0zP/hjkAJqJyenxurJ+t/OiC7OXO+cXPiIWNu7vLOIwXKVShLgn1/PBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkOfKaHD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkOfKaHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE88CC4AF09
	for <loongarch@lists.linux.dev>; Thu, 19 Feb 2026 12:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771504917;
	bh=WFgEdxjnF8A05d5mgtvj836zAZLdzQveFoZlSYE1Meo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BkOfKaHDtS3pj4WCPyqCg1YsMxbQ7QF5dW525+24v1b62MP6ztZMsuv1NqXn5HMeH
	 +SpVGAkkjhLaxb2wrjc/SC2LYPnC8syGjZyB6NC39ULW+GaJeRpHtN3tzGcqBAUptN
	 IkchXnZg6CGOV07zmiQPZcW3/DFGWdRWuEx+4lKPaqtSN68zsv5qRNMENAaYrBU2rW
	 ZO2Nta3IDPcFr7DZSFF7BIMpy8+SZR5X6S1r+SHZvtwj0fR+GrNe+o6BsqmUzg4hUA
	 x2ird0KQilHONcRPPoolfrRQujfeKiETonFgYOMMsWivRzD3eCtgF+cmnV0wFcNpuv
	 ltUm+pCea3dWA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65815ec51d3so1324689a12.2
        for <loongarch@lists.linux.dev>; Thu, 19 Feb 2026 04:41:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrDg6CfvkmUYHKEwb7k12YqmCQnmr9ufuu3XjQR6fq209+X2G/VbTA3xMyXTwrc8ny00QT8++eo4w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdCCPlOmbW67Xrf1D3jinU75I3UEwQmOFxVqMTLH54+SgJ0cdJ
	9ZOb8H3Us/5z1J9K0vNE2LmIxPKGdfPpnqHOsKoMZ5cSNn7HTt+DNzQK603Gzs0m6kyAoF2q6PB
	bshhZ111aAUr+dj85TglW+hiLFKAtrOY=
X-Received: by 2002:a05:6402:3649:b0:65c:139:2579 with SMTP id
 4fb4d7f45d1cf-65c01392959mr6141869a12.15.1771504916203; Thu, 19 Feb 2026
 04:41:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028065139.10227-1-youling.tang@linux.dev>
 <CAAhV-H6mQJ5RR4Oad9aOA2nbVa4BeFYfTHLTvdj=5dL56O7FTw@mail.gmail.com> <47e7eac65966408b28417e5be3bd6b24dd397a08.camel@xry111.site>
In-Reply-To: <47e7eac65966408b28417e5be3bd6b24dd397a08.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Feb 2026 20:41:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5t+vWE76ZNTxkyjO+wwnj83V0AYJzPd-0_rZnhfHjKBA@mail.gmail.com>
X-Gm-Features: AaiRm50MjpWomX4RMtXbJBDdS9ly54aU_H6JgA1qq2w3U57WkRbd2_FChoo8bM0
Message-ID: <CAAhV-H5t+vWE76ZNTxkyjO+wwnj83V0AYJzPd-0_rZnhfHjKBA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: jump_label: Batch icache maintenance
To: Xi Ruoyao <xry111@xry111.site>
Cc: Youling Tang <youling.tang@linux.dev>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 6:21=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Thu, 2026-02-19 at 11:44 +0800, Huacai Chen wrote:
> > > +static inline void local_flush_icache_range(unsigned long start,
> > > unsigned long end)
> > > +{
> > > +       local_flush_icache_all();
> > Just use a plain "asm volatile ("\tibar 0\n"::);", and put them after
> > __flush_cache_all().
>
> IMO for consistency it should be "ibar\t0" (without the leading \t and
> trailing \n: we don't have those in any of other inline assemblies).
Leading \t should be removed, but trailing \n can be kept (\t is also OK).

Huacai

>
> --
> Xi Ruoyao <xry111@xry111.site>
