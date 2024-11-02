Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A525D1A01BD
	for <loongarch@lists.linux.dev>; Sat,  2 Nov 2024 16:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730566008; cv=none; b=TGKMs2KlaVCLLpWDH3xaFRhbJmlXYXqjavPkfmv+6Xipx8l4znG+hJzZz6JKPbqjJ1cDJh/7iDrFNaACBSsFJ3KEulrpMicTUdC1swHIbGyvBdOZd91uRBG319IIZOZVCj0/BFzTJ0gdBsaqNyIJjm10rwE4WE+8iHTiSZ39L+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730566008; c=relaxed/simple;
	bh=GxoXhXGyHNH8GVqUExL8Ti1VvRWiwrpIEQI7tN7LYew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BaGjpi3fBRKwz03ZD4iv0jnO47zab+tRtPUoZov2xdVvw/L/mHRlJZTNM3oLXk1dDHUi3Lm4QMCsRxwGkMp3ck/XogbMNkgMB71XcUT275KZ4UzNyhxFwdguBTJuam0JnCOPwCBS8Sog8h1QTRlglCptde6bxIG2bNMe8DV6IAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJ+1XHVr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJ+1XHVr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C695C4CED5
	for <loongarch@lists.linux.dev>; Sat,  2 Nov 2024 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730566008;
	bh=GxoXhXGyHNH8GVqUExL8Ti1VvRWiwrpIEQI7tN7LYew=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NJ+1XHVrktQ9WGmo2EqP6wMVn/OEt/Sv2350oNUT4r8GsAp9SYm0VRx1/D+bpxg8g
	 AhMeZGuz9tEsHn97hHwlwmvLVZz1BdRK3HPFE5YqLcs8A8XoDyXbcjgPGJYTBYv2lw
	 e7zJmHAonSkqpKaKaw6UnNUCHZimTZLKO1FLqORq1mUqGyfy2E7ES/38e2axn3jHVc
	 vyfrkc6wWAWUTuzFcDsIW2fxGUusCopNRtdPosLD46rmwBPJUZoGz8kFjaYjXuuFth
	 EueP60OBXtYFWJvxL+0V8IT2yf0FfbKIXjL0+19V3Zm0XEOHjVKdBVOhl1og12Usc6
	 DBoCweRx5bdQg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so38125051fa.0
        for <loongarch@lists.linux.dev>; Sat, 02 Nov 2024 09:46:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzap6NOeuz+4EOJwyj3cQcN3tE9Je7DEykKOVtOU/2jHDpgZLkaNYdbOGJg0zYTZwDDiAUPmUUo8Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPE0c1xsmYej96I6MyLU6PkfbVC+iOFwwiEOmYmM+rXgbsfVGo
	WXlMktK5dbskkxdbi4zd0bMZb2tS4p8KdtGaICxv0aYcmNSOgi5X7ZeyC1QC34pyvZ+tbqWgHId
	my8OXmYdNfVUoLY+zF8ObL9xz9zo=
X-Google-Smtp-Source: AGHT+IF1qWuAPM7OXxHa9PDtIx4xdAi/SPdwq1d4i906hC2y1gUwoZbqVs2/tV8+cHeYBRRGdC2ase7pF6ri9+FpJxc=
X-Received: by 2002:a2e:bd87:0:b0:2f9:e1ce:1276 with SMTP id
 38308e7fff4ca-2fedb414a6amr24137441fa.11.1730566006632; Sat, 02 Nov 2024
 09:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241026040958.GA34351@sol.localdomain> <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au> <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
 <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
 <ZyYIO6RpjTFteaxH@gondor.apana.org.au> <20241102163605.GA28213@sol.localdomain>
In-Reply-To: <20241102163605.GA28213@sol.localdomain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 2 Nov 2024 17:46:34 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEQHiqkO7j1W55UHGg-LNF2CNiPnpHcKfCdKnxFQSJ14g@mail.gmail.com>
Message-ID: <CAMj1kXEQHiqkO7j1W55UHGg-LNF2CNiPnpHcKfCdKnxFQSJ14g@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 Nov 2024 at 17:36, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Sat, Nov 02, 2024 at 07:08:43PM +0800, Herbert Xu wrote:
> > On Sat, Nov 02, 2024 at 12:05:01PM +0100, Ard Biesheuvel wrote:
> > >
> > > The only issue resulting from *not* taking this patch is that btrfs
> > > may misidentify the CRC32 implementation as being 'slow' and take an
> > > alternative code path, which does not necessarily result in worse
> > > performance.
> >
> > If we were removing crc32* (or at least crc32*-arch) from the Crypto
> > API then these patches would be redundant.  But if we're keeping them
> > because btrfs uses them then we should definitely make crc32*-arch
> > do the right thing.  IOW they should not be registered if they're
> > the same as crc32*-generic.
> >
> > Thanks,
>
> I would like to eventually remove crc32 and crc32c from the crypto API, but it
> will take some time to get all the users converted.  If there are AF_ALG users
> it could even be impossible, though the usual culprit, iwd, doesn't appear to
> use any CRCs, so hopefully we are fine there.
>
> I will plan to keep this patch, but change it to use a crc32_optimizations()
> function instead which was Ard's first suggestion.
>
> I don't think Ard's static_call suggestion would work as-is, since considering
> the following:
>
>     static inline u32 __pure crc32_le(u32 crc, const u8 *p, size_t len)
>     {
>             if (IS_ENABLED(CONFIG_CRC32_ARCH))
>                     return static_call(crc32_le_arch)(crc, p, len);
>             return crc32_le_base(crc, p, len);
>     }
>
> ... the 'static_call(crc32_le_arch)(crc, p, len)' will be inlined into every
> user, which could be a loadable module which gets loaded after crc32-${arch}.ko.
> And AFAIK, static calls in that module won't be updated in that case.
>

Any call to static_call_update() will update all existing users, so
this should work as expected.

(Only x86 has a non-trivial implementation that patches callers inline
- otherwise, it is either an indirect call involving a global function
pointer variable, or a single trampoline that gets patched to point
somewhere else)

...
>
> So I plan to go with the crc32_optimizations() solution in v3.
>

That is also fine with me.
