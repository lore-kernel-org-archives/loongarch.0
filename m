Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9611B1805A
	for <loongarch@lists.linux.dev>; Wed, 19 Feb 2025 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739951361; cv=none; b=qaJz6643/DQS2FeRnLLbB9Rjr2D7UoeZb7fR8ooyR8VB4J28gxIiDiHReB4c9/s8BP/Gf7/DMAX9KEs04tiKOHmiNhoXAtMKYyt1JqaNJ2iHzkRzYI7gFJ243WUvQ1tL9PSm5RT7uEHQKQA4a0EhIb365uoTlSiwp5BmBZ0j+7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739951361; c=relaxed/simple;
	bh=QW0YLd5UiVymKP5/70LE4zlHCAJ02RQWRAnH96fjx4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvn0XO5MT5N3dicXo7kM8Ky1Uf7fyZtflb5854OROqh3+bpYP8R1Ia4WYDg83umDoctNPTgEdbIVhWJiiwws8lYJvdyw0AtLFajvMaQO+VyAHsrTIRwLRNF1FliEOPLLVpd9aN6R2SFbqBivu6+oftufSB8sArN1SdvVhJ/eklE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (ip5f5af295.dynamic.kabel-deutschland.de [95.90.242.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 14F8161E64788;
	Wed, 19 Feb 2025 08:48:53 +0100 (CET)
Message-ID: <82eadd04-26ed-4560-9a9d-2a55ab72a84b@molgen.mpg.de>
Date: Wed, 19 Feb 2025 08:48:52 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/6] MAINTAINERS: Add maintainer for Loongson Security
 Module driver
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: lee@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net,
 peterhuewe@gmx.de, jarkko@kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-crypto@vger.kernel.org, jgg@ziepe.ca,
 linux-integrity@vger.kernel.org
References: <20250219073214.16866-1-zhaoqunqin@loongson.cn>
 <20250219073214.16866-3-zhaoqunqin@loongson.cn>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250219073214.16866-3-zhaoqunqin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Qunqin,


Thank you for your patch, and for wanting to maintain this code. Two 
minor things should you resend:

I found it quite useful to have the maintainer name in the summary/title 
as often only the `git log --oneline` output is used in change-logs. I 
suggest:

MAINTAINERS: Add Qunqin Zhao for new Loongson Security Module driver

Am 19.02.25 um 08:32 schrieb Qunqin Zhao:
> This patch adds an entry for Loongson Security Module driver in the list
> of Maintainers.

Maintainers could be spelled lowercase.

> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> ---
>   MAINTAINERS | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5583df569c..cd6c029398 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13494,6 +13494,13 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
>   F:	drivers/i2c/busses/i2c-ls2x.c
>   
> +LOONGSON SECURITY MODULE DRIVER
> +M:	Qunqin Zhao <zhaoqunqin@loongson.cn>
> +L:	loongarch@lists.linux.dev
> +S:	Maintained
> +F:	drivers/mfd/ls6000se.c
> +F:	include/linux/mfd/ls6000se.h
> +
>   LOONGSON-2 SOC SERIES CLOCK DRIVER
>   M:	Yinbo Zhu <zhuyinbo@loongson.cn>
>   L:	linux-clk@vger.kernel.org


Kind regards,

Paul
