Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF902853F9;
	Tue, 26 Aug 2025 02:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756176461; cv=none; b=SPUPoVTYjk+skQhVUUeHkt7hcAmAwD5oyholORC9rL9FvEx/D84L0mE/JE7D/B5Sqpjl3di6EGTEqoN7sOP7knQfDlhURKO6b2ciG6TqjxXLNGD1KnUgvHL08nX0K0d2GdNusfk7O8eqzlHzkzpsCuEK7hAKeVHoFuae3FRnRnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756176461; c=relaxed/simple;
	bh=yQUTnkr0o3F8VGrJhr3/b8Wij3HDtQpfzF97302VpNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwKyXhhyI6Gyua6HYthtO9+FzpH2qs46iziHf3gU+/jhXGgM/+H+lK+D8tKBYGa2q+pQtThv0BtUHrIHSR3w9o1LGCzH6E7mTiFZeQdUxsWAgZkiU+eoxKN/Fxs8vnIUcN5u8jyK7z7v/xOl8Mf6RDvpzdqs31Z/iUu7ZIIVQFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/J1UDq8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/J1UDq8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6D0C116B1;
	Tue, 26 Aug 2025 02:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756176460;
	bh=yQUTnkr0o3F8VGrJhr3/b8Wij3HDtQpfzF97302VpNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/J1UDq86V0WbMRTPmMRyXdm/81vaz21rjmBbMI1HzIW44mqs8uUn7koMO4IPvi4D
	 XxxXUxXYGTceQRDoTMSgbvPZRsYbhBEca0n3mqOZf5tlOUBG2I/RmR/Yi5Yrns3axX
	 0tBiOZEaICGXkIXJXIuJLQP02I6vPY8f67W3YvKVEIyQAAfih1U+72jY9RKJvirQFZ
	 UHbV/TrMNenHq6X/ct1lxMi8YEBIgAx8HmPjhCdOTb0K0hbjYBlVc2p8nK2/LZ+PDF
	 hE/JslYqftHvtBxh4rJzme9m35JdVETFAQb+iaYbwthU+M4+1hXksOCHXYEhk88y6p
	 r1EIMs4QusjYw==
Date: Mon, 25 Aug 2025 19:47:40 -0700
From: Kees Cook <kees@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Rename GCC_PLUGIN_STACKLEAK to KSTACK_ERASE
Message-ID: <202508251947.B0C1B03D@keescook>
References: <20250805110754.3243432-1-chenhuacai@loongson.cn>
 <175615793761.2150029.12607347712708724677.b4-ty@kernel.org>
 <CAAhV-H4eDRUBFyn8Wny1o7uFHHWKF__Vtu+m0bhmUP2rFHkZ+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4eDRUBFyn8Wny1o7uFHHWKF__Vtu+m0bhmUP2rFHkZ+w@mail.gmail.com>

On Tue, Aug 26, 2025 at 10:42:52AM +0800, Huacai Chen wrote:
> On Tue, Aug 26, 2025 at 5:39 AM Kees Cook <kees@kernel.org> wrote:
> >
> > On Tue, 05 Aug 2025 19:07:54 +0800, Huacai Chen wrote:
> > > Commit 57fbad15c2eee772 ("stackleak: Rename STACKLEAK to KSTACK_ERASE")
> > > misses the stackframe.h part for LoongArch, so fix it.
> > >
> > >
> >
> > Applied to for-linus/hardening, thanks!
> >
> > [1/1] LoongArch: Rename GCC_PLUGIN_STACKLEAK to KSTACK_ERASE
> >       https://git.kernel.org/kees/c/351b51dc16a9
> Unnecessary, it is already in 6.17-rc3 via loongarch tree, thanks.

Ah-ha! Great; thanks!

-- 
Kees Cook
