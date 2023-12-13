Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C8A171A3
	for <loongarch@lists.linux.dev>; Wed, 13 Dec 2023 07:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.183])
	by gateway (Coremail) with SMTP id _____8AxJPCFWXlla5gAAA--.3643S3;
	Wed, 13 Dec 2023 15:13:09 +0800 (CST)
Received: from [10.20.42.183] (unknown [10.20.42.183])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxPeGBWXllsv0BAA--.13577S3;
	Wed, 13 Dec 2023 15:13:08 +0800 (CST)
Subject: Re: Re: [PATCH v5 1/4] KVM: selftests: Add KVM selftests header files
 for LoongArch
To: Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Vishal Annapurve <vannapurve@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, Peter Xu <peterx@redhat.com>,
 Vipin Sharma <vipinsh@google.com>, maobibo@loongson.cn
References: <20231130111804.2227570-1-zhaotianrui@loongson.cn>
 <20231130111804.2227570-2-zhaotianrui@loongson.cn>
 <e40d3884-bf39-8286-627f-e0ce7dacfcbe@loongson.cn>
 <ZXiV1rMrXY0hNgvZ@google.com>
From: zhaotianrui <zhaotianrui@loongson.cn>
Message-ID: <023b6f8f-301b-a6d0-448b-09a602ba1141@loongson.cn>
Date: Wed, 13 Dec 2023 15:15:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZXiV1rMrXY0hNgvZ@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxPeGBWXllsv0BAA--.13577S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF1fXr4kWr1kCFyrCryrZrc_yoW8Jw4UpF
	yI9F1aka1kGFW7tws5Jw1UuF43KFs3uF18CrWDGw4Du3Z8Jwnrtr4jkw4rKa4vyr47J3W2
	v3W2q34vqa9093gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1Ek
	sDUUUUU==



在 2023/12/13 上午1:18, Sean Christopherson 写道:
> On Tue, Dec 12, 2023, zhaotianrui wrote:
>> Hi, Sean:
>>
>> I want to change the definition of  DEFAULT_GUEST_TEST_MEM in the common
>> file "memstress.h", like this:
>>
>>   /* Default guest test virtual memory offset */
>> +#ifndef DEFAULT_GUEST_TEST_MEM
>>   #define DEFAULT_GUEST_TEST_MEM		0xc0000000
>> +#endif
>>
>> As this address should be re-defined in LoongArch headers.
> 
> Why?  E.g. is 0xc0000000 unconditionally reserved, not guaranteed to be valid,
> something else?
> 
>> So, do you have any suggesstion?
> 
> Hmm, I think ideally kvm_util_base.h would define a range of memory that can be
> used by tests for arbitrary data.  Multiple tests use 0xc0000000, which is not
> entirely arbitrary, i.e. it doesn't _need_ to be 0xc0000000, but 0xc0000000 is
> convenient because it's 32-bit addressable and doesn't overlap reserved areas in
> other architectures.
> 
Thanks for your explanation, and LoongArch want to define 
DEFAULT_GUEST_TEST_MEM to 0x130000000. As default base address for 
application loading is 0x120000000, DEFAULT_GUEST_TEST_MEM should be 
larger than app loading address, so that PER_VCPU_MEM_SIZE can be large 
enough, and kvm selftests app size is smaller than 256M in generic.

Thanks
Tianrui Zhao

