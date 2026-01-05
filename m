Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598C7311C3F;
	Mon,  5 Jan 2026 21:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767650351; cv=none; b=EqR+pFDXoJhC1JpyRkF6qxfmjZ250ZumJYF+f3SDPJPf7kqQC0Sqyu/2v6b7T5uivpFH3fx9VRAzBSd4rXSafimJufwrU+lviwpf3Ef2pjDvslIxWCkAxtqakT+jEazK8qOi+6qc9fj3WkLDz9BYA5kXmbmQq6loclTGArqV1GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767650351; c=relaxed/simple;
	bh=aDA3umVifjgp7HxupNwreJdFIm3IboLNedDVPcY1gig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTX80r3+5NsVzeY1NUFT5BNLsf338tQoTLYvNXC9b7MfBBWZOs3H3GF/ycyiUWcAjUi1KXzQMpb2Uy6vBnoRQ3yUjBjJuKrbYMNJZrHoK76xqhRJYdpuR6uhrRY+yMG5fSBPKjcijcl96cAL+yMedYquWdTGpAim1oKBUP1qVUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wl92b341; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wl92b341"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF150C116D0;
	Mon,  5 Jan 2026 21:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767650350;
	bh=aDA3umVifjgp7HxupNwreJdFIm3IboLNedDVPcY1gig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wl92b341PUKDAEarxcxoRFgk9uVLWlTSYYzx9F3T/bDduwpdQJULBKsi0+FMhe9Ay
	 gs4pWXHKQT3P+155yVdC6xuIdOcChnx8WoKLJ9FISYAr/LbO8REDFrdjhUDiAEPeBs
	 dwTPwHayernrY4lprlNqOscrGVcri6QIZl0WkUasc3D7yDf1E7iLsnH3cw2uX96LiV
	 LvxQae2ExBh4gjPjGBQLPb+at2ioxSD16JiDqqOkonc4GV4nFjpTyLWZr2SrL/EjqQ
	 qw6KsPlAzhy92uGqXWCwb096OWgOSjqt2Ggurt4wvqIyzd+a+VLAXh3UHwCDOueFJj
	 qrxZj8MyFGw/g==
Date: Mon, 5 Jan 2026 15:59:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: loongarch@lists.linux.dev, Xuerui Wang <kernel@xen0n.name>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, Yao Zi <me@ziyao.cc>,
	Binbin Zhou <zhoubb.aaron@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/9] dt-bindings: interrupt-controller:
 loongson,eiointc: Document address-cells
Message-ID: <176765034711.3497692.5285475427538860143.robh@kernel.org>
References: <cover.1767505859.git.zhoubinbin@loongson.cn>
 <3e903541d37432c88c27272094420b03418a607d.1767505859.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e903541d37432c88c27272094420b03418a607d.1767505859.git.zhoubinbin@loongson.cn>


On Sun, 04 Jan 2026 14:41:12 +0800, Binbin Zhou wrote:
> The Loongson Extend I/O interrupt controller can be referenced in
> interrupt-map properties (e.g. in
> arch/loongarch/boot/dts/loongson-2k0500.dtsi), thus the nodes should
> have address-cells property.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/interrupt-controller/loongson,eiointc.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!

