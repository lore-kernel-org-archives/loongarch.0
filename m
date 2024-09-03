Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B6A1A2621
	for <loongarch@lists.linux.dev>; Tue,  3 Sep 2024 07:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725349563; cv=none; b=PHP38rdy5K0KxhIwGjvrRX1DCvC+b0KJPpz154knod2bKlInnh5BO5EycdtTSOMO+Qh7u7GE0YJ6UrO3+vYp7kwUIykmMhjRnxS3jc7Q9+OY+k7eyi9NVxZyHfhx3lWL3akgxo73W+9VjwF3e/AJhWIMdaTiARs8Eavg/5kbkyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725349563; c=relaxed/simple;
	bh=/JzVx6L0qG21YJlHpk5PhVLISRfwB6M1/FfJXA/jhew=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=XRX8JAtTS06LH5fFzdnPDRbWFwABA0NFBe/6HCFaaf0FTAFYUEzhrzEuiPopmFUtzHCMBq0vEqC4+UXsyZfrLt4s6jZ/fK04piB+TYmAGNXDUW2tODWJ7OSmxwgvHtvNmCmrBMozW2CiDq1PHyI2aoyIJSaU6exWV0HvaIJeqAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8Axipq1vtZmm_QoAA--.43139S3;
	Tue, 03 Sep 2024 15:45:57 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front2 (Coremail) with SMTP id qciowMAx_8WzvtZmFKYEAA--.13239S2;
	Tue, 03 Sep 2024 15:45:56 +0800 (CST)
Subject: Re: [PATCH v2 2/2] Loongarch: EDAC driver for loongson memory
 controller
To: Markus Elfring <Markus.Elfring@web.de>
Cc: loongarch@lists.linux.dev, linux-edac@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 James Morse <james.morse@arm.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Robert Richter <rric@kernel.org>,
 Tony Luck <tony.luck@intel.com>, Wang Xuerui <kernel@xen0n.name>
References: <20240903015354.9443-3-zhaoqunqin@loongson.cn>
 <f338a355-4ce6-4d63-8659-21b9d6c7eebc@web.de>
From: Zhao Qunqin <zhaoqunqin@loongson.cn>
Message-ID: <c7162a2b-3570-e5d4-e6aa-152074c9ce90@loongson.cn>
Date: Tue, 3 Sep 2024 15:45:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <f338a355-4ce6-4d63-8659-21b9d6c7eebc@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qciowMAx_8WzvtZmFKYEAA--.13239S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUBEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUAVWUtwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5WrAUUUUU=


在 2024/9/3 下午2:33, Markus Elfring 写道:
> …
>> +++ b/drivers/edac/ls3a5000_edac.c
>> @@ -0,0 +1,187 @@
> …
>> +MODULE_AUTHOR("Zhao Qunqin <zhaoqunqin@loongson.cn>\n");
> How do you think about to omit a line break character from such a string literal?
I will drop \n in next version patch.

Best regards,

Zhao Qunqin.

>
> Regards,
> Markus

