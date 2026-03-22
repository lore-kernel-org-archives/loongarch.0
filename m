Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E9175A9A
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774184076; cv=pass; b=Lum777zrQgzlqw8WIINcwAMajuC3CN1ylIqY65vhDrjTkM/KcwOGUcKRSxjdkw1L+twGeh0RFuG01roJeOGk0VLrMoFIFAJbXsWjUoSCEAaWXl3PlqMgwcBPjwlonZNmSwWGLExixJb3moJkn68sFV8DS62RRcEnt8MLtvvWEYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774184076; c=relaxed/simple;
	bh=kK8YmrNobKxYA3KUUj6T5vQZMaKkS94DHt4c/CNipck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pt1bv6hxvo1Y48j/0NrMXLmBT/HeKN7MLmKQ2bteYmxLApCb7klYSNZuT4CR3Ok/cgdjrcVzqePPSwgw/BdDQnEiHFcp11OEFnSbnmw8zM28hj50d/I+dvXHTyGPHDxSTQv40xLtkPjUEKRLY7jy/V5iDPMe+37E0eDMGceAS2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=SmjsFG73; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="SmjsFG73"
ARC-Seal: i=1; a=rsa-sha256; t=1774184061; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eXPqSucoXJsTOL/gq9TzCD3uy/NKgNQz+BIi6zjT+gRPjZtROtqxxoBFPpnpfAjFyWTJnrXXyiGQcAE8rS8ank5dxcreaPqlCXlfy1t0V2kouRrv00ZdfMgtGDHsQeZt5OTX0B7NO/5g+kUxavBhNBc6Hx51NTkPfrpMkdOoehw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774184061; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SAZ/XZ7+svKGJe8JsDFrKqgEYqASCcKqQxqvSqGACmE=; 
	b=lcR04uVX7YnSgBsega3pT3aezhhDcj3SzRoKW3DeUVKNNqdRm4apJkFKsAYCbNiPTlwQN1M7Ji601yTugIkkQWMtVtXMTa77cO+3KmykZAU6f1QawlhMEG/002ZYm1bZMuLFenDrXOuXg2Rj+fzca0nrPoFJv5mp0LGrk/oFYU8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774184061;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=SAZ/XZ7+svKGJe8JsDFrKqgEYqASCcKqQxqvSqGACmE=;
	b=SmjsFG73xr9Vl4p0jEt20RC4Eyq1O6Ew9qyhPNdW+0m5us9gd9kIP4mEVq7DA83g
	q8ectuVkUtjZX1f5ccPByFHwuJ1Gtq4/t9MpRWthmxgK1OFq23GMd5JZtWHhTnhKzST
	QJc+tlDLAlAtXW/HXnF2xowN3FOOufEQGGVf9nIo=
Received: by mx.zohomail.com with SMTPS id 17741840598081005.9843335790677;
	Sun, 22 Mar 2026 05:54:19 -0700 (PDT)
Date: Sun, 22 Mar 2026 12:54:05 +0000
From: Yao Zi <me@ziyao.cc>
To: wjjsn <wjjsn@qq.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, chenhuacai@kernel.org, zhuyinbo@loongson.cn,
	mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, kernel@xen0n.name,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: loongson,ls2k: add ls2k1000
 compatible
Message-ID: <ab_mbVVQ9Nf7pTRt@pie>
References: <20260322081915.1626723-1-wjjsn@qq.com>
 <tencent_1EA9B7D351AF8169F880BAAA49B37E178A08@qq.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_1EA9B7D351AF8169F880BAAA49B37E178A08@qq.com>
X-ZohoMailClient: External

On Sun, Mar 22, 2026 at 04:19:14PM +0800, wjjsn wrote:
> Add a SoC-specific "loongson,ls2k1000-clk" compatible.
> Retain the existing "loongson,ls2k-clk" as a deprecated fallback
> for backward compatibility.
> 
> Signed-off-by: wjjsn <wjjsn@qq.com>
> ---
>  .../devicetree/bindings/clock/loongson,ls2k-clk.yaml        | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> index c07ad1f85857..4d70bc4e7a13 100644
> --- a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> @@ -13,12 +13,16 @@ description: |
>    Loongson-2 SoC clock control module is an integrated clock controller, which
>    generates and supplies to all modules.
>  
> +  The "loongson,ls2k1000-clk" string should be used for Loongson-2K1000.
> +  The "loongson,ls2k-clk" string is kept as a fallback for backward compatibility for Loongson-2K1000.
> +
>  properties:
>    compatible:
>      enum:
>        - loongson,ls2k0300-clk
>        - loongson,ls2k0500-clk
> -      - loongson,ls2k-clk  # This is for Loongson-2K1000
> +      - loongson,ls2k-clk
> +      - loongson,ls2k1000-clk

If you want to deprecate loongson,ls2k-clk, you should probably mark
it as "deprecated: true", instead of describing such situation in human
language.

I don't have a strong opinion on the change, but I don't think it
improves the situation much. We still need to document the historical
compatible in bindings and support it in driver, the only thing gets
improved is a slightly more clear compatible name in devicetree.

However, even if someone is confused by the current compatible, they
could have a look in the binding and get an explanation quickly.

Regards,
Yao Zi

>        - loongson,ls2k2000-clk
>  
>    reg:
> -- 
> 2.43.0
> 
> 
