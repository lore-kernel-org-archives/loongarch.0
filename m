Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309939;
	b=IkuJQ6F8o1F7wjdZTkx2xsERwqYexV05e216mWLcYq8B2m4QaMTGH7kBoV2DKyTpFJGp
	 SPQHhiYfX+vI3ndE28KSofx6/ZO0Qoa+NN6mFimYfxz2tjzusQDBTYPp7k1E5UwTBcVYw
	 zcp1sRgVyog7jO6FKhBVVlevYseINyCNKBNbKXkOqhE6Ps7Znr+ZaqPtgUAFuHa7/bpYt
	 M7MAgMDIJ9e3LFIUMO8EvUULzioaGjctb9BCj2HwOrGrSlmDe5e6CuTyWUNB5F20/SqpN
	 RlAJHzkS4AlLrCN0UTAOsTkXOrFuQJsuxeEN2WR4pJWr/2ovbjwu3lwmBC5tMJhTibw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309939;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Qg+S1T/e+Zoz4FEz/2Ax5PBXiBkavSDjIEMgsAhVa/s=;
	b=bZ53uFIvAtxZ1iSCHQYpFI/05C5nrz1v6hGZnHc1BTwc/bdFYb8UWnLM43uhxBoimJNF
	 uVbDrbfTLdzOaDiSGLgshWQ08As83I/EUIRLwcAxC4vDgkfrRGD39ZobRJkKTkRH+k+FA
	 owk0TG+G1RUJ9HrjiOU8wk/iScSkAgG/qMy+aRUmUMWaMh/yholO8lkOP3s6rrh6W6zsZ
	 iJButQU+xRvCBSiyCZQULs2dInR+ADde2gud1KwAG6HPWsM5xYP7mGxIIONVHNoOEq6Rj
	 ozrl6Hy1ZFZbelwbYK0JRMjEFfpr6cPp2qMkW1ZsswyB/V27tEE51AL4HIycqXL3EyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bUCgqnTO;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDDD60A5BFE
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 11:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEDDD60A5BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bUCgqnTO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Qg+S
	1T/e+Zoz4FEz/2Ax5PBXiBkavSDjIEMgsAhVa/s=; b=bUCgqnTOn84GD+oLcWH5
	MfALaS0iCSjACuqkekHSTi0wZrPCdof1G1P7VHCiXT9pd+G2ZEyKFIBzA3MQVMq8
	lVW/F4CjalifNZujc2/SFmRDHArACuOmP+A+zdMXJmI6eM8aP23si5LIDR5HsDva
	iMhHO+/UZ+cD7RB+W4PlkTr83gWByIds4aMKrqia1QNpFYMzs0jLoV2r/FkGsAVj
	TuS+h+i2XlaVTYCc8kgV0lQuIguAuruUF/4r+4o2sLYnhQ3Xr3sRG8cvjiY64zCt
	DSfumNWY1g6dxc2/s3nFK7DMHW5vuGMO/msPNMBWOHNgRj74az0tAayvnNHt706H
	AA==
Received: (qmail 210108 invoked from network); 10 Nov 2026 12:25:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 12:25:34 +0100
X-UD-Smtp-Session: l3s3148p1@4JNFVupfCKgujnsO
Date: Tue, 10 Nov 2026 12:25:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hongliang Wang <wanghongliang@loongson.cn>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, loongarch@lists.linux.dev,
	Huacai Chen <chenhuacai@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v11 1/2] dt-bindings: i2c: ls2x-i2c: Add clocks and
 clock-frequency properties
Message-ID: <avL_LiNnRVELGDN3@shikoro>
References: <20261106030203.15709-1-wanghongliang@loongson.cn>
 <20261106030203.15709-2-wanghongliang@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106030203.15709-2-wanghongliang@loongson.cn>

On Fri, Nov 06, 2026 at 11:02:02AM +0800, Hongliang Wang wrote:
> Add clocks and clock-frequency properties to examples.
> 
> Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>

Applied to my for-andi branch, thanks!

