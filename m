Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050692;
	b=DlWCSU4Puxz5r1uZzF4fwG92ywHoWP93eT3qZ+LueIxBjKDuVv4EmosyzgqflK3uTN7b
	 r07fNuDxqy4HjsfmKJdw3VNo68wWlaUyHHuClEFWl3FGJyYocH7o5AxKXyfL98nduGmuj
	 U3vMoqX0sV0ivKUg4GvsMoObVhTaADRlQfwH5o+qrOJK3u+YyJzvRJoOe1Ikub8YSk3ma
	 WOYMlJbCzqgGr+up602ofGdiJXtc2W8cFeR8V0EKmXzmOlH2HhqLVbdyNGZcbxayCM/SZ
	 Z1UAuLx0yhuJsZLr41jTNjy+nKx6OY0s9c/j0hoEbUbxabFt0shIZs9PO3+6gmCpTDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050692;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=dqweL7BsG9XRQRfrzEERF8eiQCXHDKK+nX4SLZICRgY=;
	b=1BoRHD7P/bqlQaqqb2Xg3972KvZTcN/W9zfjl2QUvkmHm/yKapqrukBHOOt9kNXvXEaO
	 W8bh2X3DqQ8bt+4cgRBI6b7GtNUNiufvY87bDMMnZogrbifWjdlXZ9ikBATksQuE4TOqH
	 16rL7467dzcB/Egiae+1/9JmBDN95MeJBg8kQwe9q1UJ1R98JKxDc37do2oY0BPSbI4Tl
	 41veuTSOWqMA8Dh3F30TMChdGqxiqG9bjrVu/cCuuU/xucftou+h66hqKA1gkIhaVcnzK
	 5F9l5ntEvfcVp+WfFjbEM/lih8aVXmVrIk/yKG6yEvhsIiKKaGEBK/HL8pVSyHcimEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC9F606A32C
	for <loongarch@lists.linux.dev>; Thu, 19 Nov 2026 01:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC9F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Ax39K9TP5qFgAhAA--.28756S3;
	Thu, 19 Nov 2026 09:11:25 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCx9cy7TP5qNr41AA--.14754S2;
	Thu, 19 Nov 2026 09:11:25 +0800 (CST)
Subject: Re: [PATCH v2] LoongArch: BPF: Fix the offset of stptr.w and stptr.d
 stores
To: Huacai Chen <chenhuacai@kernel.org>, George Guo <dongtai.guo@linux.dev>
Cc: hengqi.chen@gmail.com, guodongtai@kylinos.cn, bpf@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261118071444.10258-1-dongtai.guo@linux.dev>
 <CAAhV-H4TNuXk60LyzZhFwQTfNtdzLEFQTwS84u3ZMQ6b=8S0NA@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0f79389b-ceb3-8c2f-16bb-1111ac40fc43@loongson.cn>
Date: Thu, 19 Nov 2026 09:11:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4TNuXk60LyzZhFwQTfNtdzLEFQTwS84u3ZMQ6b=8S0NA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx9cy7TP5qNr41AA--.14754S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WrW5XryxZry8ZFWUKFy8Zwc_yoW8Jw4kpw
	4DKw4SyrykArZ3twnxXwn5J3WIyw45Kr45WrW3t34DAw15WFyIgFyxKFW5Kay5XrZ5Zw1U
	ZFWxtw1xua9xJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UU
	UUU==

On 11/18/26 7:59 PM, Huacai Chen wrote:
> On Wed, Nov 18, 2026 at 3:15 PM George Guo <dongtai.guo@linux.dev> wrote:
>>
>> From: George Guo <guodongtai@kylinos.cn>
>>
>> When testing bpf selftests "jit_insns" and "jit_insns_blinded", the
>> "ldst_offsets" subtest fails for word and doubleword stores:

...

>>   #define is_signed_imm12(val)   signed_imm_check(val, 12)
>> -#define is_signed_imm14(val)   signed_imm_check(val, 14)
> Is there instructions really take a 14bit imm (not something like
> ldptr.d/stptr.d)?
> If yes, I suggest keeping is_signed_imm14() because maybe we need it in future.

According to the LoongArch Reference Manual, there are 8 instructions
in total that take a 14-bit signed immediate (si14):
ldptr.{w,d}, stptr.{w,d}, ll.{w,d}, and sc.{w,d}.

All of them implicitly shift si14 left by 2 bits when calculating the
virtual address (vaddr = GR[rj] + SignExtend({si14, 2'b0}, GRLEN)),
so none of them take an unscaled 14-bit immediate directly.

In the JIT, byte offsets for all these instructions should be validated
with is_aligned_signed_imm16() and encoded as (off >> 2). Removing the
unused is_signed_imm14() macro also helps prevent similar misuse in the
future.

So there is no need to keep is_signed_imm14(), and v2 should be good
to go.

Thanks,
Tiezhu

