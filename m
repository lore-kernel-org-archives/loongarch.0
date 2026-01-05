Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784FC311596;
	Mon,  5 Jan 2026 21:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767650340; cv=none; b=nsaKOKlMH2RgMRrBbbAPNVrPKPSd+3amJPPjnCaoUz5+iLAdMTHw598iLNSb9G2aG1Gdvy0KcRlEVmi+wEayMZqqauEAdlOVOUvd0zwZ5h0rtP88SYHMNpvZjabuhyBJd/XunibRQGifHw3O1gE7n68cLWg7IBi7ILXCk78hz2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767650340; c=relaxed/simple;
	bh=DlV9DP7I0dzrk3hissmSRRvq/6kxkN1Ky7Nr5lV+lgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teMcSMhEncPYReu8tgP+S0RvAZZJKBiyHO5t8i5g5BV9OvZUf1nFKYwI0+a6QqU2p+OjG+2Zb4js6gW7JcwftoPWdCR8MvSdFTs2DLlFKeRD5/foYHWY8lwpO66bHVN9MxBBvK6dZ/lm+mgSNo45KMt4yE4tuduxZOXjSXuHno8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWyzWMWq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWyzWMWq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD401C116D0;
	Mon,  5 Jan 2026 21:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767650340;
	bh=DlV9DP7I0dzrk3hissmSRRvq/6kxkN1Ky7Nr5lV+lgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWyzWMWqvkZ2Bz001YE5++7ZLI9BsPKFVtkijMYssrnHMIDno2hzw4Amu7nqIv8S+
	 nVoDR7Aw82sok3eHlhKnpKZv4iNVixDsYUf3M/C5ffzFe1GXEx4yUq0s2mdZURABSG
	 im3gdBWH7lDQOAnlcLr8pxfzD57cL79f9CMUGZclMrSCOgM7sMvhBwWpSoQlZ6pd97
	 CAj25CHVTn4t10QZoJwXrvL2OR6bvDyl5PnOWqkEs7zSmwRqLW5s8JUvon1rCQehT6
	 gI1gu45XncUSW/MHzEmFNF7hfWaddemswybL495ojGx5WTPjxuvH4LR47aARHX3x7j
	 qRyHuL/mM3U/w==
Date: Mon, 5 Jan 2026 15:58:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev, Yao Zi <me@ziyao.cc>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Xuerui Wang <kernel@xen0n.name>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 3/9] dt-bindings: interrupt-controller:
 loongson,liointc: Document address-cells
Message-ID: <176765033788.3497315.16286065135263772732.robh@kernel.org>
References: <cover.1767505859.git.zhoubinbin@loongson.cn>
 <fb3811b6bc387aa23adfc0aaf9a0a31c2d468e79.1767505859.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb3811b6bc387aa23adfc0aaf9a0a31c2d468e79.1767505859.git.zhoubinbin@loongson.cn>


On Sun, 04 Jan 2026 14:41:13 +0800, Binbin Zhou wrote:
> The Loongson local I/O interrupt controller can be referenced in
> interrupt-map properties (e.g. in
> arch/loongarch/boot/dts/loongson-2k1000.dtsi), thus the nodes should
> have address-cells property.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/interrupt-controller/loongson,liointc.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!

