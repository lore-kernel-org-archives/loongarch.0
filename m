Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1C87C6D4
	for <loongarch@lists.linux.dev>; Wed,  7 Aug 2024 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021277; cv=none; b=kzj5NhoSM0tlHARm5cZy4x/wNckAOuHXfeCR2+kDZKgXX0XfuKrQmwoyhnWrEAqrbFz2idfFbuqynAgXAxX3TARG0K78zUcYzf2xvlEeDefIzM/DP2KN8LwJPilHOGWCjQt5MUlLfWOTeYYuUQXt0qOiKTzXuSenVPQ+kgLfLlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021277; c=relaxed/simple;
	bh=VrxUh8bJKgrlvtMlVbgyzBh6rB37ARtcuOLChGDiwds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RP9jjus+PcBkQFxTDKXMItDvLbHvOuIBcyln3GvBrUB83RJKaZGHq2wD5AkF5YvdEB/lYuGo2ZjoKhWjIPDXQbhtpbdoLuQDqwtX1KS2/7DkObciNI+SVTXApMvjpdDkXsrkEKWBgrCDkZP4QVWYe7Ln7sfTOSGUHWYarLBf9pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.4.132])
	by gateway (Coremail) with SMTP id _____8BxrOraN7Nm5DAKAA--.32256S3;
	Wed, 07 Aug 2024 17:01:14 +0800 (CST)
Received: from [10.20.4.132] (unknown [10.20.4.132])
	by front1 (Coremail) with SMTP id qMiowMCxM+DZN7Nm+MEHAA--.10739S2;
	Wed, 07 Aug 2024 17:01:13 +0800 (CST)
Message-ID: <f14e56dc-8bbf-43f0-871c-f556abb563d9@loongson.cn>
Date: Wed, 7 Aug 2024 17:01:13 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: serial: Add Loongson UART controller
To: Xi Ruoyao <xry111@xry111.site>, Krzysztof Kozlowski <krzk@kernel.org>,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, p.zabel@pengutronix.de
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, loongarch@lists.linux.dev
References: <20240804063834.70022-1-zhenghaowei@loongson.cn>
 <4d1f2426-b43c-4727-8387-f18edf937163@kernel.org>
 <f31609c4-1e47-49bc-9231-5b0353d35dc9@loongson.cn>
 <6c7ec8196fe01aa651f8b59b445b70de79137181.camel@xry111.site>
Content-Language: en-US
From: =?UTF-8?B?6YOR6LGq5aiB?= <zhenghaowei@loongson.cn>
In-Reply-To: <6c7ec8196fe01aa651f8b59b445b70de79137181.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxM+DZN7Nm+MEHAA--.10739S2
X-CM-SenderInfo: x2kh0w5kdr4v3l6o00pqjv00gofq/1tbiAQECBGayEXMQlAABs1
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	W8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	cyxRUUUUU


在 2024/8/7 16:39, Xi Ruoyao 写道:
> On Wed, 2024-08-07 at 16:23 +0800, 郑豪威 wrote:
>> The file "drivers/tty/serial/8250/8250_loongson.c" will be created in
>> the patch
>>
>> "tty: serial: 8250: Add loongson uart driver support". Is it
>> inappropriate to reference it here?
> You should add this line in the second patch then.  Separating a large
> change into multiple patches in a series is not for formalities' sake.
> Each patch should be logically intact on its own.
>
Thank you, I got it.


Best regards,

Haowei Zheng

