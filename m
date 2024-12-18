Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F791FA828;
	Wed, 18 Dec 2024 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734548761; cv=none; b=gSvOWUP+HEHfMk0uh8VIQNberTCJNee3awoqBEDF9n4nJRsShhBMJSFPSiHXwYb1FSBI66wI7GSOE+ceC6wwyV5zU7FgB0eis7P7JB2NCfdYOR33IpTCvZyQipRogUsmwNjT66ULBVYCQWGZ4Qlz7gS9F1+xD+/2F8qaknslHPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734548761; c=relaxed/simple;
	bh=s8I59DHOReFsqMjDpIrOMGgg9VMuysWKuT+LcUwsDFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAl+PdmL/003TgUuJ5E6fkNWXHEusepb5P7Av/MMkkYN1F0+8wOFvakaZhyaGjI2G0uMJF2GQfTlkqleOoqZuhxAuMat8dq8J2dD3pV7/lF/JBX3/UIwasUvFswx234GnGlp/IKt8iFvLqSxg7UXXm+qA6OsKCZCV29aGyuItAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SgWujbWq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SgWujbWq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC63CC4CECD;
	Wed, 18 Dec 2024 19:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734548760;
	bh=s8I59DHOReFsqMjDpIrOMGgg9VMuysWKuT+LcUwsDFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SgWujbWqNAuI3SetRENzu3S+BO3gUB9sa1jRxD34d6yvxqknjHcKAucgomoYJ7SBH
	 FGRGkz2EGrq7brpwim+RJum47chntue6bFx1H5H4nzbuRyCYpxvQJDD85QkxPVBJSB
	 X2e8qQX1UzTEspo+UxUCkXXsNCDalteVqlJPGhAoayqAp/0SfrmiT9k/go3KIiUDk2
	 SeAACHji472GBvEanhoP5pg01cPpJnv+cnjkzZPNqwJ4x/UcJ7keRyiCCHoUK07W0X
	 UZbkeEDEwGtKJbSXOha9ylafMl3eP7EjXk2ASf+rPF3sLuyAL1Q8BLJeVajL0D/rh1
	 OUW3K4yqf6QBw==
Date: Wed, 18 Dec 2024 11:05:58 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 9/9] drm/amd/display: Mark dc_fixpt_from_fraction()
 noinline
Message-ID: <20241218190558.g2hykmjgbny4n5i3@jpoimboe>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <20241217015006.30305-1-yangtiezhu@loongson.cn>
 <CAAhV-H4WpcWjrQdkm3Sx4DVbp=2oW9nNGAbNqR4BEmiryrptNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4WpcWjrQdkm3Sx4DVbp=2oW9nNGAbNqR4BEmiryrptNQ@mail.gmail.com>

On Wed, Dec 18, 2024 at 10:36:00PM +0800, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> On Tue, Dec 17, 2024 at 9:50 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> >
> > When compiling with Clang on LoongArch, there exists the following objtool
> > warning in drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.o:
> >
> >   dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
> >
> > This is because dc_fixpt_from_fraction() is inlined in dc_fixpt_recip()
> > by Clang, given dc_fixpt_from_fraction() is not a simple function, just
> > mark it noinline to avoid the above issue.
> I don't know whether drm maintainers can accept this, because it looks
> like a workaround. Yes, uninline this function "solve" a problem and
> seems reasonable in this case because the function is "not simple",
> but from another point of view, you may hide a type of bug.

Agreed, it sounds like there's definitely a bug which this patch is
papering over.

-- 
Josh
