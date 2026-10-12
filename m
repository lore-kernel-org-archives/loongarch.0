Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE3E306D2A
	for <loongarch@lists.linux.dev>; Mon, 12 Oct 2026 13:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810487; cv=none; b=AGwjQtfVTIY2jGtRDlYEjd6fD08knDPmfb+tzAFKQjYv+afLg4etKvggHuUEInng4hSMCH5n+ltwZ66YEKNrxzF5NvRd+qmuhuKIr2H1vonFBpBLFEH4itJ2Rtqnyml9agOn7khoDc3RqvJ5FqYYlsmiZEtnytzAAFLXNfpZcMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810487; c=relaxed/simple;
	bh=POvujTz1z34bw0MZ3uiykvcaFRM070LEG/g06kGP3aI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F4+Xvi3UmtU2gq20OzUs7DGbjZndmrUVu62fWzTw1dhWD9IRI10deYwc5hbok94nh2gj3u2iUVuiQi4no4VIDddzxqz06D0Efa1VlAlh+PU10oqQp8qDTK7JkgM2DIRQyw7EuOcIxTNc6cr9eP0liRHC/mIM2ThXl0EWvjQiSTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmZG9Pax; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmZG9Pax"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-487049569b6so1313430f8f.1
        for <loongarch@lists.linux.dev>; Mon, 12 Oct 2026 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791810484; x=1792415284; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qEXjo4xNLEHjAPgm22WbApSKp4thYvSYX5Y5T/p9yxo=;
        b=FmZG9PaxKVXRLcjQ8NQ7R+PyeYuTtt4Yf7xGeRBhhoh0eVefpTuI9OID1alnRFXCzH
         M7MVA/EqBGT7/G1DNpJAZCXP3fz/q/NF2SZ0m/yrBiHv5iv09dMxzIe/oZRNYNUry0tp
         zmdUddxk/mJ8zL41K2uvRxqZxmCTl3ZuT+86KJpwS/31jse9QyR042h6smJgRPDNEPar
         PRUlLml7wL6rw5EWtw5lxQIWBOzPKcEjwY/gwgXYRlso8ulXdYMOMh/XXS3aPzjG7Eim
         StGzc08iSf/Cy3mVJj5p2QKLr1sYKu8grYPdv40bsNM18KFYPQ2l6VYPCIINmUsi2Dep
         lSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810484; x=1792415284;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEXjo4xNLEHjAPgm22WbApSKp4thYvSYX5Y5T/p9yxo=;
        b=hcx5DvUw9oRQ/qiAD0YPdJqb/u8SdrFvZRbnqxf3Sv4MzNM4Wz9ws8KD8SNLgdUFDc
         A2KU4GDNsKuIhbG8ZW4ZYhj+AR5ACs9B9MSl3tbbUlDFnBlvasDwx3dP0P91+vHQMEJg
         RgpW851W6caqzSHFLUZpWfDqbA6Y+2y4/x107BiHDjmIPK4s49lKFZKJeHtNIzpoLmIX
         W/0sN6HBVLrO4+PRpypRlfJ2DykmKyzWbPm+gQ7VyzuWaYhDNFplW6Dq0zZb0g9dn1L7
         aJVYl7+BYJQcOSbC1R5+Vg8erU/XGtfnYRS/A5zkX/6U7wIkNHO/3GC0PIIQjA9D+r4e
         /jEg==
X-Forwarded-Encrypted: i=1; AKwUvByF8ssqu8xNgd5Qv37/3aLCWBNbRVNz7MyCJ9AMt8zd44G24WNSGntJSY/OwOxEMEfSvy63tE8bJrw=@lists.linux.dev
X-Gm-Message-State: AFq9FYJyninMFBYCxneQ8Y/U3l27tZ3qQv8FkWeVS+SiVWgtmiv7jE55
	F4SHKIg0NZj4EgyxXhyx7553X3uS7OY+vHo3KKi2TNa3l6R4cGacpjg+
X-Gm-Gg: AYBFou2MLYpy3POgV2UvBTSw0hZVEYrbw6JhoWraR+/ufAqgI7av4Ftyh9L1YgnVzfO
	6wT6S0IjISBtGofpJELhvmtHrxQVaYyPlHQsSPaytglarW3qPQKUSXO+V28l3cBVBmT0ktJjtmi
	K1lC2IsblF/abQN5lzDUl17GO9BPOFmUC+N8ySfP6qhDaslIlJG4ZOpxXaPhVEK5V4GE+2OP+Se
	IBIJE+IoiGt/+xcaB0TbJvxj+z77iK49HAuiZnlQ10T50kaLA0z+Gm6840mPvlXz/6BatR4/aMb
	hsSNWndZNzrz6W9I77tE0GwDkl4rE08RBf3CDp5l2rlK8lHWcRYv+RBZA8NKwHhSZEDwl/Ac5Gn
	OouhRp71Oujf16xZd69I53renmEJWYsLT8qe/A6J8CDz9QkgpOUBhKq9LcMTAZeyQsoG/wsQ7d7
	wu23W1vggKojT9a153OGLR5UISqvAy9clA9UZI8tO0XdWCPQWJQhPEyWS1/uK7nvChE2XViLgie
	z/KiCjjwRDx7adre6+IYRiCQBnU9ZFVGig=
X-Received: by 2002:a05:600c:3541:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4a18e4e9ee8mr165470305e9.32.1791810484032;
        Mon, 12 Oct 2026 06:08:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2e0dbsm305917465e9.11.2026.10.12.06.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:08:03 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:08:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Wentao Guan" <guanwentao@uniontech.com>
Cc: "Eric Biggers" <ebiggers@kernel.org>, "chenhuacai"
 <chenhuacai@kernel.org>, "Huacai Chen" <chenhuacai@loongson.cn>, "Ard
 Biesheuvel" <ardb@kernel.org>, "linux-crypto"
 <linux-crypto@vger.kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "loongarch" <loongarch@lists.linux.dev>, "linux-kernel"
 <linux-kernel@vger.kernel.org>, "Tianyang Zhang"
 <zhangtianyang@loongson.cn>
Subject: Re: [PATCH 1/2] lib/crc: loongarch: Use hardware unaligned load in
 CRC32(C) loops
Message-ID: <20261012140802.267c293a@pumpkin>
In-Reply-To: <tencent_339CC94656CDACB222608A27@qq.com>
References: <20261011142930.492999-1-chenhuacai@loongson.cn>
	<20261011150052.GA168780@quark>
	<tencent_4750F9C704AA3CFA1E7309B7@qq.com>
	<CAAhV-H59DV-qF98M1Uu=Y4k1a8YNw0_RnP_nH-yr8fZu-jnFXQ@mail.gmail.com>
	<20261012072200.GA828441@google.com>
	<tencent_339CC94656CDACB222608A27@qq.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 19:11:02 +0800
"Wentao Guan" <guanwentao@uniontech.com> wrote:

> Hi Eric,
> 
> > On Mon, Oct 12, 2026 at 02:43:47PM +0800, Huacai Chen wrote:  
> > > Yes, we considered modifying {get,put}_unaligned_* globally. But it is
> > > not arch-specific code and we have no way to override it.
> > >
> > > On the other hand, the byte-to-byte {get,put}_unaligned_* is always
> > > correct, we are free to only optimise the hot path (like crc32 code).  
> > 
> > The unaligned access macros are used in lots of other
> > performance-critical code.  Hacks in random places don't scale.  
> Agree, from their side, they thought may like: the change is minimal?
> My thought like what other arch did, use alternative to patch the {get,put}_unaligned_*?
> 
> > > > > Since loongarch made the incorrect decision to not specify unaligned
> > > > > access unconditionally, similar to RISC-V it can be worked around only
> > > > > by overriding that in the kconfig.  For loongarch that appears that
> > > > > already be implemented; just unset CONFIG_ARCH_STRICT_ALIGN when you
> > > > > know the kernel will run only on CPUs that have fixed this bug.  
> > > > I think that we have the use cases to provide the general kernel instead of the two kernel with
> > > > different config, so the image increase will be tolerated.  
> > > Yes, the default configuration is to keep CONFIG_ARCH_STRICT_ALIGN set
> > > for single kernel binary.  
> > 
> > So don't do that.  It does not work for divergent unaligned access
> > support, as the other architectures have learned long ago.  
>
> From RISC-V workaround learn, their model is different,
> they want to default unaligned access, and trap and emulate the access.

Which is entirely broken from a performance point of view.
Especially since some system hide the emulation from the kernel.

> 
> This LoongArch model is point to default safely aligned access,
> after detected the unaligned access support, next to use the unaligned to speed up.
> Or did anything I missing?

There are three cases:
1) Unaligned accesses fault and must be avoided.
2) Unaligned accesses are executed by the cpu but take a small number
   of extra cycles.
3) Unaligned accesses are executed by the cpu and are (almost always)
   free.
For (2) it is still worth aligning buffers.
x86 is pretty much in camp (3) - I suspect it uses byte-enables on a 64 byte
wide interface to the cache.

If you align buffers you don't have to worry about things like
'word at a time strlen()' running off the end of a page.

David

> 
> BRs
> Wentao Guan
