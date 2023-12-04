Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CCD10F0
	for <loongarch@lists.linux.dev>; Mon,  4 Dec 2023 02:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8BxpPBvNW1lJaI+AA--.59581S3;
	Mon, 04 Dec 2023 10:11:59 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxO9xsNW1le8lTAA--.53472S3;
	Mon, 04 Dec 2023 10:11:58 +0800 (CST)
Subject: Re: [PATCH v5 4/4] KVM: selftests: Add test cases for LoongArch
To: Tianrui Zhao <zhaotianrui@loongson.cn>, Shuah Khan <shuah@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, Peter Xu <peterx@redhat.com>,
 Vipin Sharma <vipinsh@google.com>
References: <20231130111804.2227570-1-zhaotianrui@loongson.cn>
 <20231130111804.2227570-5-zhaotianrui@loongson.cn>
From: maobibo <maobibo@loongson.cn>
Message-ID: <ebdc956b-6235-370f-97d1-c24540c05047@loongson.cn>
Date: Mon, 4 Dec 2023 10:11:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231130111804.2227570-5-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxO9xsNW1le8lTAA--.53472S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uw17Kr4DtFyDCF4kGFW3urX_yoW8KFWrpF
	yI9r1jvFWxurs3Jwn3Gw4DZan3Cr9Fgr40gFy3Kw18ur98J348JF1xKasrKFsYgw45Xa1Y
	v3WrKwnruayDA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
	WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2F4i
	UUUUU



On 2023/11/30 下午7:18, Tianrui Zhao wrote:
> There are some KVM common test cases supported by LoongArch:
> 	demand_paging_test
> 	dirty_log_perf_test
> 	dirty_log_test
> 	guest_print_test
> 	kvm_binary_stats_test
> 	kvm_create_max_vcpus
> 	kvm_page_table_test
> 	memslot_modification_stress_test
> 	memslot_perf_test
> 	set_memory_region_test
> And other test cases are not supported by LoongArch. For example,
> we do not support rseq_test, as the glibc do not support it.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   tools/testing/selftests/kvm/Makefile | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index a5963ab9215..9d099d48013 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -65,6 +65,10 @@ LIBKVM_s390x += lib/s390x/ucall.c
>   LIBKVM_riscv += lib/riscv/processor.c
>   LIBKVM_riscv += lib/riscv/ucall.c
>   
> +LIBKVM_loongarch += lib/loongarch/processor.c
> +LIBKVM_loongarch += lib/loongarch/ucall.c
> +LIBKVM_loongarch += lib/loongarch/exception.S
> +
>   # Non-compiled test targets
>   TEST_PROGS_x86_64 += x86_64/nx_huge_pages_test.sh
>   
> @@ -202,6 +206,17 @@ TEST_GEN_PROGS_riscv += kvm_binary_stats_test
>   
>   SPLIT_TESTS += get-reg-list
>   
> +TEST_GEN_PROGS_loongarch += demand_paging_test
> +TEST_GEN_PROGS_loongarch += dirty_log_perf_test
> +TEST_GEN_PROGS_loongarch += dirty_log_test
> +TEST_GEN_PROGS_loongarch += guest_print_test
> +TEST_GEN_PROGS_loongarch += kvm_binary_stats_test
> +TEST_GEN_PROGS_loongarch += kvm_create_max_vcpus
> +TEST_GEN_PROGS_loongarch += kvm_page_table_test
> +TEST_GEN_PROGS_loongarch += memslot_modification_stress_test
> +TEST_GEN_PROGS_loongarch += memslot_perf_test
> +TEST_GEN_PROGS_loongarch += set_memory_region_test
rseq_test is not supported by LoongArch kernel, and get-reg-list 
interface is not supported by KVM now, arch specific testcases
will be added later also.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
> +
>   TEST_PROGS += $(TEST_PROGS_$(ARCH_DIR))
>   TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH_DIR))
>   TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH_DIR))
> 

