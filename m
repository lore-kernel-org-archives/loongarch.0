Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4813F9F59;
	Wed, 25 Mar 2026 16:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774457797; cv=none; b=coNXrNumsgdL839oki4fLR/CZ/7Ai5iPQUZ/+6nFM1Xx5w/0A8TQ+j6/uQWcG98Mq4FtfuJiJg7rJrHTgFw4NdgeCBABKEUGMitkS6CstzJ40yfAtS6CAZ8cwN0MaSWYx968R/Fu+q5NCqQc9OUD1NH7laMXmAIIPfaupDwwZDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774457797; c=relaxed/simple;
	bh=nSw2lrn2nb3FSW1weQ7HQ6/iUtBr1GWD2ycn0MvOTP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdI1urSw/Ka8XiHSf7qGxrmVO4KG/kt3uafC3c1rrC8nw9RerRgD5ZeaBvxww/gRa6yrBGTbMhxrpuFSntDSEKWNnS7Me4PpreZ8PfcnKcNw4P4OGEFFqp+7V/65ks9GUSwiGAabIs+kNiCNdh37tEJ62I9ie+n8InnFcU5QwIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZUMs9j7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZUMs9j7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98B5C4CEF7;
	Wed, 25 Mar 2026 16:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774457797;
	bh=nSw2lrn2nb3FSW1weQ7HQ6/iUtBr1GWD2ycn0MvOTP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oZUMs9j76Jqk91FBs0rwcXrdo3IxtULfbpzGJMJ4FK+B2Ed3zq4uZ7E5652lgOnVG
	 6muSyJjacU63N6tyVzL8ssBrRMmkBAgVnCunwhAdBJEkhmtzFPGVOOdg+m/vAXxSbs
	 nIZQDGDL/Z3XvjDpoWN7G9ZyMp4lr3cdJBIoVltVJMfDfAnoQZsUXkULo3NQmha8bm
	 tEuqN/oUjJIsi8/y1YDSPm4urq+Pt0gdDiOF4t4V3VCLYSYfoCT7039TxI5MEmO/NL
	 f3HmQ3rfBFhtbBJ51lsDN/c8B3VmuzaHGtMvq2bAOaUkQ7XHnWOpX5NFMGPMVB9CO6
	 B/2YIW+4TYoPw==
Date: Wed, 25 Mar 2026 11:56:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Yao Zi <me@ziyao.cc>,
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>, Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH v4 3/6] dt-bindings: interrupt-controller: add LS7A PCH
 LPC
Message-ID: <177445776596.3796148.15919783727977087972.robh@kernel.org>
References: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
 <20260321092032.3502701-4-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321092032.3502701-4-zhengxingda@iscas.ac.cn>


On Sat, 21 Mar 2026 17:20:29 +0800, Icenowy Zheng wrote:
> Loongson 7A series PCH contains an LPC controller with an interrupt
> controller.
> 
> Add the device tree binding for the interrupt controller.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  .../loongson,pch-lpc.yaml                     | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

