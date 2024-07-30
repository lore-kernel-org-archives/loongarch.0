Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A93C1A2548
	for <loongarch@lists.linux.dev>; Tue, 30 Jul 2024 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722351566; cv=none; b=u8XfJaPfp3cXohmNBwVVwo9L340LJ7YX5EbLVTqspDKTtJ1K5zBRIq0b9kfwZnsOfe5zOmcQpNUmeZXje4+QCpJNeDvhN4npkkyU9ka53SW+CyRivMybkksWtIEXlt3Y7CGOgc74EwNebq38iHLlLjm5i/+lt2NTPZmjuqxOTqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722351566; c=relaxed/simple;
	bh=tbPxI0Kty8tEmLVLppSue3V2MjQ4KE4rXfIJq4dQ42s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlSc3Z5U6OAsyJRzLb+cOZpVqECNpt3ffuqJLhaqhXDAoqr3GkIeKyMIRdcqrTEPCnGr5K2va4lPtP7OgDRlJwU4AkoMX8ZnJi8Z9KbDSNHzMxEJxzv1HwPhTtN5Wm2Pl2TiErNL5K5isjRgaIMBAolENfpqWO9UoVGIjp8N8F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [36.44.126.21])
	by gateway (Coremail) with SMTP id _____8AxW+rK_6hmN44EAA--.15974S3;
	Tue, 30 Jul 2024 22:59:22 +0800 (CST)
Received: from [192.168.0.108] (unknown [36.44.126.21])
	by front1 (Coremail) with SMTP id qMiowMDxucXK_6hmj8MGAA--.33683S3;
	Tue, 30 Jul 2024 22:59:22 +0800 (CST)
Message-ID: <6db87355-ff1a-71f3-9bbd-5c47edaf3128@loongson.cn>
Date: Tue, 30 Jul 2024 22:59:22 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] objtool/LoongArch: Restrict stack operation
 instruction
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240730061901.21485-1-yangtiezhu@loongson.cn>
 <20240730061901.21485-2-yangtiezhu@loongson.cn>
 <CAAhV-H5qoaBwJe929+GnYzbrbmcMgTXy5zL8smXDmOSCtAQntw@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
In-Reply-To: <CAAhV-H5qoaBwJe929+GnYzbrbmcMgTXy5zL8smXDmOSCtAQntw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMDxucXK_6hmj8MGAA--.33683S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
	07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07j1LvtUUUUU=

On 7/30/24 16:59, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> Can this patch also fix the warnings of ClangBuiltLinux?

For now, objtool is only built with GCC, I will try to build with
Clang after the known issues are solved.

Thanks,
Tiezhu

