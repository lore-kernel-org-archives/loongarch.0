Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5A92F12AF
	for <loongarch@lists.linux.dev>; Tue,  3 Mar 2026 03:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772510098; cv=none; b=DU+y25MlMBSzZv4KewTmmzZj6qJVMhfRFQv3eJcNgQKBLRPpJVAN5R9k5s5YaRdtcYmllN4EbBz7cYQ77dgTtR8JKHvFam83/U5s3NZf9npbIXFm+0sYlwb7rzHmfkAjO7JMsoqnMiqtAA7LJKe48ftjThLAw1AiXMD4o1BSZ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772510098; c=relaxed/simple;
	bh=RGWnQo32idVwzGjSVUcvWaFpWkVwatNcwHnmCfLFbDc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=sMCM8iXxnlP+87PF3JLABHKfb0z+H7guvFlFPsu8O3+mdJajDsc3cdPOZOsiE/cFwdJet+Vy14/DyTIwcKLn8LnHMhyMUt8c8fNrh6lisnwT2IbfGJCB3WZFodibRpj2pHjagO/vnANvN8N0uXBzMw5dme7JcaNnK9uTRZ3r/D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.30])
	by gateway (Coremail) with SMTP id _____8Dx88CHW6Zp0ukWAA--.9818S3;
	Tue, 03 Mar 2026 11:54:47 +0800 (CST)
Received: from [10.2.10.30] (unknown [10.2.10.30])
	by front1 (Coremail) with SMTP id qMiowJAxWcGFW6ZpMXdNAA--.2933S3;
	Tue, 03 Mar 2026 11:54:45 +0800 (CST)
Subject: Re: [PATCH v6 0/2] LongArch: KVM: Add DMSINTC support irqchip in
 kernel
To: Yao Zi <me@ziyao.cc>, maobibo@loongson.cn, chenhuacai@kernel.org
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev, kernel@xen0n.name,
 linux-kernel@vger.kernel.org
References: <20260206012028.3318291-1-gaosong@loongson.cn>
 <aYVhSp_eGBkpXdp-@pie>
From: gaosong <gaosong@loongson.cn>
Message-ID: <df4de374-c5ef-6652-985f-39598e234e35@loongson.cn>
Date: Tue, 3 Mar 2026 11:54:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aYVhSp_eGBkpXdp-@pie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJAxWcGFW6ZpMXdNAA--.2933S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJr1DCr48Zw1fAFW8trWfXrc_yoW8Xw47pF
	W7Ga4jkrWDXw15Kws29FW0ga1jvrn3Jry8W39Iqa42kFWDur1xWr4fGrWjy3s2g3yfGw1S
	y3srW343ZF1UZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU24So
	DUUUU

在 2026/2/6 上午11:34, Yao Zi 写道:
> On Fri, Feb 06, 2026 at 09:20:26AM +0800, Song Gao wrote:
>> Hi,
>>
>> This series  implements the DMSINTC in-kernel irqchip device,
>> enables irqfd to deliver MSI to DMSINTC, and supports injecting MSI interrupts
>> to the target vCPU.
>> applied this series.  use netperf test.
>> VM with one CPU and start netserver, host run netperf.
>> disable dmsintc
>> taskset 0x2f  netperf -H 192.168.122.204 -t UDP_RR  -l 36000
>> Local /Remote
>> Socket Size   Request  Resp.   Elapsed  Trans.
>> Send   Recv   Size     Size    Time     Rate
>> bytes  Bytes  bytes    bytes   secs.    per sec
>>
>> 212992 212992 1        1       36000.00   27107.36
>>
>> enable dmsintc
>> Local /Remote
>> Socket Size   Request  Resp.   Elapsed  Trans.
>> Send   Recv   Size     Size    Time     Rate
>> bytes  Bytes  bytes    bytes   secs.    per sec
>>
>> 212992 212992 1        1       36000.00   28831.14  (+6.3%)
>>
>> v6:
>>    Fix kvm_device leak in kvm_dmsintc_destroy().
>>
>> v5:
>>    Combine patch2 and patch3
>>    Add check msgint feature when register DMSINT device.
>>
>> V4: Rebase and R-b;
>>     replace DINTC to DMSINTC.
>>
>>
>> V3: Fix kvm_arch_set_irq_inatomic() missing dmsintc set msi.(patch3)
>>
>> V2:
>> https://patchew.org/linux/20251128091125.2720148-1-gaosong@loongson.cn/
>>
>> Thanks.
>> Song Gao
>>
>> Song Gao (2):
>>    LongArch: KVM: Add DMSINTC device support
>>    LongArch: KVM: Add dmsintc inject msi to the dest vcpu
> There's a typo in the titles, it should be LoongArch instead of
> "LongArch".

Hi,   huacai

Should I need send v7 to fix this typo error?

Thanks.

Song Gao
>
> Best regards,
> Yao Zi
>
>

