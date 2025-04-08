Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB536269802
	for <loongarch@lists.linux.dev>; Tue,  8 Apr 2025 12:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114046; cv=none; b=pH72iR3dcfUOA/jHrmUGQUgKf+IYqZeyqw8GutcpH+S9P2y6P3jqdwDYKLYihqRgDfmIwlqETwwuw7byjnobADLs76yGHGBTg9vopd6uwg9b57i1rgMB1K8f5HWX5XFFCIerwZeVtiYL6VqFEuaoTIpxsDIYJwBIU65yJNjtvjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114046; c=relaxed/simple;
	bh=4xk3N2B6Mc9xDyAGaMLZ2BFi+v4fW/GstaPpYxvbW2Y=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=n1Fp15tP18CUSPqcFa148ba5N9hN2bSl0c+iXARouyLQa/w7WfpTT3YuS6ps0EJ0g/rdOHtb+FGK4vX17xRCdnG7GlrZZDrshG902ee1nSJsfw2krsl6uiU6LtD1Qe3aRbNfkqzv0JdIP91fvAoEuOdmMyONkyrwfSqwV76fgls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8CxieB2EfVnsSe1AA--.60671S3;
	Tue, 08 Apr 2025 20:07:18 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front1 (Coremail) with SMTP id qMiowMAxTsVzEfVnhbB0AA--.35019S2;
	Tue, 08 Apr 2025 20:07:17 +0800 (CST)
Subject: Re: [PATCH v7 3/6] crypto: loongson - add Loongson RNG driver support
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: lee@kernel.org, davem@davemloft.net, peterhuewe@gmx.de,
 jarkko@kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-crypto@vger.kernel.org, jgg@ziepe.ca, linux-integrity@vger.kernel.org,
 pmenzel@molgen.mpg.de, Yinggang Gu <guyinggang@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
References: <20250403024645.4427-1-zhaoqunqin@loongson.cn>
 <20250403024645.4427-4-zhaoqunqin@loongson.cn>
 <Z_NOsSBRWUEToa7_@gondor.apana.org.au>
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
Message-ID: <1d890c5f-2bae-1a44-d79b-ab1614b51203@loongson.cn>
Date: Tue, 8 Apr 2025 20:06:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z_NOsSBRWUEToa7_@gondor.apana.org.au>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMAxTsVzEfVnhbB0AA--.35019S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxAqzxv262kKe7AKxVWUXVWUAwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==


ÔÚ 2025/4/7 ÏÂÎç12:04, Herbert Xu Ð´µÀ:
> On Thu, Apr 03, 2025 at 10:46:42AM +0800, Qunqin Zhao wrote:
>> Loongson's Random Number Generator is found inside Loongson security
>> engine.
> Is this a hardware RNG or a pseudo RNG? If it's pseudo, it should
> provide a means of reseeding.

Will provide a means of reseeding.

Thanks for your comments.

BR, Qunqin.

> If it's a hardware RNG it should register with hwrng.
>
> Cheers,

