Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFE763A
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 02:50:41 +0000 (UTC)
Received: from loongson.cn (unknown [10.40.46.158])
	by gateway (Coremail) with SMTP id _____8AxnOoAzotkEs4FAA--.12295S3;
	Fri, 16 Jun 2023 10:50:40 +0800 (CST)
Received: from [192.168.124.126] (unknown [10.40.46.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxluT+zYtkSMgcAA--.16273S3;
	Fri, 16 Jun 2023 10:50:38 +0800 (CST)
Subject: Re: [PATCH v13 30/30] LoongArch: KVM: Add maintainers for LoongArch
 KVM
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn,
 Xi Ruoyao <xry111@xry111.site>, tangyouling@loongson.cn
References: <20230609090518.2130926-1-zhaotianrui@loongson.cn>
 <20230609090518.2130926-31-zhaotianrui@loongson.cn>
 <CAAhV-H6ddLNgMocmE7UtpLmrqsCUYYbwxqhFJ6OOGCUCLTXAhg@mail.gmail.com>
From: zhaotianrui <zhaotianrui@loongson.cn>
Message-ID: <7306f3a7-42c3-1e9b-8515-7e7613b60f4f@loongson.cn>
Date: Fri, 16 Jun 2023 10:50:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6ddLNgMocmE7UtpLmrqsCUYYbwxqhFJ6OOGCUCLTXAhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8DxluT+zYtkSMgcAA--.16273S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFWrtw48CF4rJryfJw1UurX_yoW8XFW5pF
	4kAF4kCFs7Gr4xAwsrKasI9a43XrykCr12qasxK348Zr1DWw1kXrWUt3Z09FZ0qasYgF40
	vwn3Kw129F4UXrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jz5lbUUU
	UU=


在 2023/6/15 下午5:27, Huacai Chen 写道:
> Hi, Tianrui,
>
> On Fri, Jun 9, 2023 at 5:06 PM Tianrui Zhao <zhaotianrui@loongson.cn> wrote:
>> Add maintainers for LoongArch KVM.
>>
>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>> ---
>>   MAINTAINERS | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 27ef11624748..c2fbfd6ad4e5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11357,6 +11357,18 @@ F:     include/kvm/arm_*
>>   F:     tools/testing/selftests/kvm/*/aarch64/
>>   F:     tools/testing/selftests/kvm/aarch64/
>>
>> +KERNEL VIRTUAL MACHINE FOR LOONGARCH (KVM/LoongArch)
>> +M:     Tianrui Zhao <zhaotianrui@loongson.cn>
>> +M:     Bibo Mao <maobibo@loongson.cn>
>> +M:     Huacai Chen <chenhuacai@kernel.org>
>> +L:     kvm@vger.kernel.org
>> +L:     loongarch@lists.linux.dev
>> +S:     Maintained
>> +T:     git https://github.com/loongson/linux-loongarch-kvm
> I'm not sure, but I think this should be a tree which can be used to
> send PR for upstream maintainers. If no other selection, we should use
> git git://git.kernel.org/pub/scm/virt/kvm/kvm.git
>
> Huacai

Thanks, I will use this kvm source link.

Tianrui Zhao

>> +F:     arch/loongarch/include/asm/kvm*
>> +F:     arch/loongarch/include/uapi/asm/kvm*
>> +F:     arch/loongarch/kvm/
>> +
>>   KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
>>   M:     Huacai Chen <chenhuacai@kernel.org>
>>   M:     Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
>> --
>> 2.39.1
>>
>>

