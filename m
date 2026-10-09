Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D6D4E66A2;
	Fri,  9 Oct 2026 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557005; cv=none; b=OJ42/wz2OBtXewjmldW2XXQPL6jfzJJYgy6R6dgqeiTRPCIjKAAOL2nQHugtSyWsasZyVesoaTL4gs8e2hAanahXnJ56N9O6zpofJIhiZOF0SXIoNtjTqbZ0Bzj+FpBIloY2swc6kVnyde7RdZHnQ/9oM9R8Kx+/8jifgAhKtuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557005; c=relaxed/simple;
	bh=5qD14P1+rCozfB+IxkFINCXwkrxjg9n2MrvAxANGug4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYRHFHSpq+VrAaKjcgmEXqG9R+8dSQMDq5DdeNIvgSRinHqC71gO9os6fyauTrIlAOAnrQjvK5+5XXh2MzFFKynnH5puskKD53xaTER0HhjjXwce0Mg8bTnfW4eHiGY6MG7HG7MhVtnPs9Xl4fkEY4eLNS26eOWA9CrK0PdO4Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDrJRmY9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDrJRmY9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E53B1F000FF;
	Fri,  9 Oct 2026 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791557004;
	bh=5qD14P1+rCozfB+IxkFINCXwkrxjg9n2MrvAxANGug4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NDrJRmY9Abz/gRCj1aqBFo3MVwQlyHgX1GJe5sTmW4HZs/fLd4EcB+Wbmdn8VHy84
	 Xe/PAWsUJEAU5KV+0Lkk6BbPtpuPIaaQD/rUXNZ9tWI3adpPxfAA7ovKiTeioa3ASx
	 7gKPOv1rPURYEWN0/Pad9RJJyFinIMwWeajhuT/ejIoG2oy5W3T6F4BE10KWowuAO3
	 yAPoA6YjDTW+JPOyOFPOlmzgne8f0o74R0ydWK4UBArMfWdDp0JHsnNq/oo7dM1x4j
	 JzbMxsWtLhL3FLYLwGJ+ewkq9GWUu3+lsPipDNmT8MRE3hdNztNGaSpv3pninP0+3t
	 Vfpeii1lWwikQ==
Date: Fri, 9 Oct 2026 15:43:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: dma: loongson: Add Loongson-2K0300
 DMA mux support
Message-ID: <20261009-96837a5ceb3894c1a8f8a784@squawk>
References: <cover.1791535540.git.zhoubinbin@loongson.cn>
 <f3f1563c342c53ead5ca625cadc447002c77c22d.1791535540.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mIzqLOJi+vhEZZAG"
Content-Disposition: inline
In-Reply-To: <f3f1563c342c53ead5ca625cadc447002c77c22d.1791535540.git.zhoubinbin@loongson.cn>

--mIzqLOJi+vhEZZAG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--mIzqLOJi+vhEZZAG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasj9gwAKCRB4tDGHoIJi
0lA+APwIPFt5Rp54mDJMMIB4FcPe/gfbEpUOyYsmjDRPa0W0ZwEA+icJcp8bNE8X
v5mJzhHyUJ2l1n6jxVso7pFWJ233Sgs=
=UypV
-----END PGP SIGNATURE-----

--mIzqLOJi+vhEZZAG--
