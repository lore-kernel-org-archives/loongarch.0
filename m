Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4292585
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 06:52:20 +0000 (UTC)
Received: from loongson.cn (unknown [10.40.46.158])
	by gateway (Coremail) with SMTP id _____8CxLOujTstk+oYPAA--.30752S3;
	Thu, 03 Aug 2023 14:52:19 +0800 (CST)
Received: from [192.168.124.126] (unknown [10.40.46.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxHCOiTstkNcpGAA--.32882S3;
	Thu, 03 Aug 2023 14:52:19 +0800 (CST)
Subject: Re: [PATCH v1 4/4] selftests: kvm: Add LoongArch tests into makefile
To: Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Vishal Annapurve <vannapurve@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, Peter Xu <peterx@redhat.com>,
 Vipin Sharma <vipinsh@google.com>, maobibo@loongson.cn
References: <20230801020206.1957986-1-zhaotianrui@loongson.cn>
 <20230801020206.1957986-5-zhaotianrui@loongson.cn>
 <ZMqcKzrSsw9WGeTC@google.com>
From: zhaotianrui <zhaotianrui@loongson.cn>
Message-ID: <37029e59-78f7-d9e8-7ee9-4a221141111a@loongson.cn>
Date: Thu, 3 Aug 2023 14:52:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZMqcKzrSsw9WGeTC@google.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8BxHCOiTstkNcpGAA--.32882S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uF48Jr13XrW3GrWfAFWDGFX_yoW8uw1Upa
	48CF1qyFWxur47Gw1xWw4DZan7Gr92gF40gFyfK348uwnxJ34xJr17KasrGFsY9w4jqa1a
	v3WFgFnF9ayDA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8
	JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x07jFRRiUUUUU=


ÔÚ 2023/8/3 ÉÏÎç2:10, Sean Christopherson Ð´µÀ:
> On Tue, Aug 01, 2023, Tianrui Zhao wrote:
>> Add LoongArch tests into selftests/kvm makefile.
> Please elaborate on how the lists of tests was chosen.  E.g. explaing why
> LoongArch isn't supporting kvm_binary_stats_test, rseq_test, etc.
The kvm_binary_stats_test is supported by LoongArch and we will add it 
later, but the rseq_test is not supported by LoongArch and the glibc, so 
we do not add it.

Thanks
Tianrui Zhao
>
>> Based-on: <20230720062813.4126751-1-zhaotianrui@loongson.cn>
>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>> ---
>>   tools/testing/selftests/kvm/Makefile | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
>> index c692cc86e7da..36a808c0dd4c 100644
>> --- a/tools/testing/selftests/kvm/Makefile
>> +++ b/tools/testing/selftests/kvm/Makefile
>> @@ -55,6 +55,10 @@ LIBKVM_s390x += lib/s390x/ucall.c
>>   LIBKVM_riscv += lib/riscv/processor.c
>>   LIBKVM_riscv += lib/riscv/ucall.c
>>   
>> +LIBKVM_loongarch += lib/loongarch/processor.c
>> +LIBKVM_loongarch += lib/loongarch/ucall.c
>> +LIBKVM_loongarch += lib/loongarch/exception.S
>> +
>>   # Non-compiled test targets
>>   TEST_PROGS_x86_64 += x86_64/nx_huge_pages_test.sh
>>   
>> @@ -181,6 +185,13 @@ TEST_GEN_PROGS_riscv += kvm_page_table_test
>>   TEST_GEN_PROGS_riscv += set_memory_region_test
>>   TEST_GEN_PROGS_riscv += kvm_binary_stats_test
>>   
>> +TEST_GEN_PROGS_loongarch += kvm_create_max_vcpus
>> +TEST_GEN_PROGS_loongarch += demand_paging_test
>> +TEST_GEN_PROGS_loongarch += kvm_page_table_test
>> +TEST_GEN_PROGS_loongarch += set_memory_region_test
>> +TEST_GEN_PROGS_loongarch += memslot_modification_stress_test
>> +TEST_GEN_PROGS_loongarch += memslot_perf_test
>> +
>>   TEST_PROGS += $(TEST_PROGS_$(ARCH_DIR))
>>   TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH_DIR))
>>   TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH_DIR))
>> -- 
>> 2.39.1
>>

