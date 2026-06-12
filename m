Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30C71DF26E;
	Fri, 12 Jun 2026 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279917; cv=none; b=NNZd0vL1n7FIrwZ0CFXA5FXCU3cmOVsZngtGBVYOkBrQoDZeF+gBrPyoMFwGzJGT+tCiVghSgPYIfc7FZX5O4nMtLu7l3ZL/ISy9h5eip95holBbx2xDwWoeuRrTmyXvRXGvZELBNhQh2WsikDuxBm8+GdGYJVS8p+kFPTjPCWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279917; c=relaxed/simple;
	bh=7+X3SjJVPaTPnOi9bicKMfVUryy++bS3E4LZ0Ltw1mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=citiFVmQjVY9yzTAKX0VqcyDc5/JDW68wZwMFgjkc6N9xonMGj9D0ts20AbDxkX8rj1ZbdfDlFA8UEMPkU7LCkjlPF3YtHoCoIVi4mUT7Xfa+Hzj5EIoNiEJoW1x3Qu3IAIZk5b26CxUYHZd/9A/B/GQpzcKBwM1lJ5BUj/rpLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEjXRRG4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEjXRRG4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AC71F000E9;
	Fri, 12 Jun 2026 15:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781279916;
	bh=+a5jpUAwh8fsVU0v6dEuxINafF/FO5hpGm8pw8mFSZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oEjXRRG4FcmjRa+T6eHXO00vZx2h7/wXzLXSm3Ey8XPBsSMbST/O9FZ2a68sXSiG3
	 S7ly83bVesEe/SSO0L8b0wNYgRX1L2w7/e+syrkNXSF9uzhtNBHfgPV2+Frzd9KjLi
	 mdshLHlw6b2S1aCi08bXKCtMiXqP7y3pmHUuzZPDKDzoiSJ8MyB306gYpXsttv5kEg
	 Tb4kOefphM1y6ZGlmUHU11OBAn1gL96ZMjoFWtjhvilMZWCYmOq+CkURPAIpJhtzmZ
	 JlXGvIQ0Dznd4dHiSkM3p707YMsQsHtCJIeuQEkZQaxcHa1Ec1+3IXDlCyKSXKD8LG
	 4Sjh2XOas3dUw==
Date: Fri, 12 Jun 2026 10:58:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Huacai Chen <chenhuacai@loongson.cn>, devicetree@vger.kernel.org,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	loongarch@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>
Subject: Re: [PATCH v2 3/7] ASoC: dt-bindings: loongson,ls-audio-card: Use
 common sound card
Message-ID: <178127991507.1115108.662303762612860150.robh@kernel.org>
References: <cover.1780538113.git.zhoubinbin@loongson.cn>
 <bbbcfd66b3b98713315f1af374c8da1065c8db68.1780538113.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbbcfd66b3b98713315f1af374c8da1065c8db68.1780538113.git.zhoubinbin@loongson.cn>


On Thu, 04 Jun 2026 10:11:23 +0800, Binbin Zhou wrote:
> Reference the common sound card properties. This allows removing the
> `model` property and directly using the common `audio-routing` property
> later on.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/sound/loongson,ls-audio-card.yaml        | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

