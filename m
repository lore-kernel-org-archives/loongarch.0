Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB44441F
	for <loongarch@lists.linux.dev>; Fri, 17 Nov 2023 01:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [10.40.46.156])
	by gateway (Coremail) with SMTP id _____8Cx7+tTyFZlZbQ6AA--.49233S3;
	Fri, 17 Nov 2023 09:56:36 +0800 (CST)
Received: from [192.168.100.135] (unknown [10.40.46.156])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxH91SyFZlxcxEAA--.22204S3;
	Fri, 17 Nov 2023 09:56:35 +0800 (CST)
Subject: Re: [PATCH v4 0/4] KVM: selftests: Add LoongArch support
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 Peter Xu <peterx@redhat.com>, Vipin Sharma <vipinsh@google.com>,
 maobibo@loongson.cn, Sean Christopherson <seanjc@google.com>
References: <20231108025134.2592663-1-zhaotianrui@loongson.cn>
From: zhaotianrui <zhaotianrui@loongson.cn>
Message-ID: <32b34bc1-f0f0-0155-6df0-ac7725527bb8@loongson.cn>
Date: Fri, 17 Nov 2023 09:47:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231108025134.2592663-1-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8AxH91SyFZlxcxEAA--.22204S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxKw1Uuw17Kr1kJFykKF1fKrX_yoWfCr1Dpa
	yFqr1FkF4fJFy7Aw1xJ34kZ34S9as7CFWUCw13KrykZrnFy34kJry8Ka92y34fua4DXw1S
	vay8CwnxW3WDGagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXU
	UUUU=

Hi, all:
This is a PING message, please help to review the LoongArch KVM 
selftests patches.

Thanks
Tianrui Zhao
ÔÚ 2023/11/8 ÉÏÎç10:51, Tianrui Zhao Ð´µÀ:
> We add LoongArch support into KVM selftests and there are some KVM
> test cases we have passed:
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
>
> Changes for v4:
> 1. Remove the based-on flag, as the LoongArch KVM patch series
> have been accepted by Linux kernel, so this can be applied directly
> in kernel.
>
> Changes for v3:
> 1. Improve implementation of LoongArch VM page walk.
> 2. Add exception handler for LoongArch.
> 3. Add dirty_log_test, dirty_log_perf_test, guest_print_test
> test cases for LoongArch.
> 4. Add __ASSEMBLER__ macro to distinguish asm file and c file.
> 5. Move ucall_arch_do_ucall to the header file and make it as
> static inline to avoid function calls.
> 6. Change the DEFAULT_GUEST_TEST_MEM base addr for LoongArch.
>
> Changes for v2:
> 1. We should use ".balign 4096" to align the assemble code with 4K in
> exception.S instead of "align 12".
> 2. LoongArch only supports 3 or 4 levels page tables, so we remove the
> hanlders for 2-levels page table.
> 3. Remove the DEFAULT_LOONGARCH_GUEST_STACK_VADDR_MIN and use the common
> DEFAULT_GUEST_STACK_VADDR_MIN to allocate stack memory in guest.
> 4. Reorganize the test cases supported by LoongArch.
> 5. Fix some code comments.
> 6. Add kvm_binary_stats_test test case into LoongArch KVM selftests.
>
> changes for v1:
> 1. Add kvm selftests header files for LoongArch.
> 2. Add processor tests for LoongArch KVM.
> 3. Add ucall tests for LoongArch KVM.
> 4. Add LoongArch tests into makefile.
>
> All of the test cases results:
> 1..10
> # timeout set to 120
> # selftests: kvm: demand_paging_test
> # Testing guest mode: PA-bits:36,  VA-bits:47, 16K pages
> # guest physical test memory: [0xfbfffc000, 0xfffffc000)
> # Finished creating vCPUs and starting uffd threads
> # Started all vCPUs
> # All vCPU threads joined
> # Total guest execution time: 0.200804700s
> # Overall demand paging rate: 326366.862927 pgs/sec
> ok 1 selftests: kvm: demand_paging_test
> # timeout set to 120
> # selftests: kvm: dirty_log_perf_test
> # Test iterations: 2
> # Testing guest mode: PA-bits:36,  VA-bits:47, 16K pages
> # guest physical test memory: [0xfbfffc000, 0xfffffc000)
> # Random seed: 1
> # Populate memory time: 0.201452560s
> # Enabling dirty logging time: 0.000451670s
> #
> # Iteration 1 dirty memory time: 0.051582140s
> # Iteration 1 get dirty log time: 0.000010510s
> # Iteration 1 clear dirty log time: 0.000421730s
> # Iteration 2 dirty memory time: 0.046593760s
> # Iteration 2 get dirty log time: 0.000002110s
> # Iteration 2 clear dirty log time: 0.000418020s
> # Disabling dirty logging time: 0.002948490s
> # Get dirty log over 2 iterations took 0.000012620s. (Avg 0.000006310s/iteration)
> # Clear dirty log over 2 iterations took 0.000839750s. (Avg 0.000419875s/iteration)
> ok 2 selftests: kvm: dirty_log_perf_test
> # timeout set to 120
> # selftests: kvm: dirty_log_test
> # Test iterations: 32, interval: 10 (ms)
> # Testing Log Mode 'dirty-log'
> # Testing guest mode: PA-bits:36,  VA-bits:47, 16K pages
> # guest physical test memory offset: 0xfbfff0000
> # Dirtied 453632 pages
> # Total bits checked: dirty (436564), clear (1595145), track_next (70002)
> # Testing Log Mode 'clear-log'
> # Testing guest mode: PA-bits:36,  VA-bits:47, 16K pages
> # guest physical test memory offset: 0xfbfff0000
> # Dirtied 425984 pages
> # Total bits checked: dirty (414397), clear (1617312), track_next (68152)
> # Testing Log Mode 'dirty-ring'
> # Testing guest mode: PA-bits:36,  VA-bits:47, 16K pages
> # dirty ring count: 0x10000
> # guest physical test memory offset: 0xfbfff0000
> # vcpu stops because vcpu is kicked out...
> # Notifying vcpu to continue
> # vcpu continues now.
> # Iteration 1 collected 3201 pages
> # vcpu stops because dirty ring is full...
> # vcpu continues now.
> # vcpu stops because dirty ring is full...
> # Notifying vcpu to continue
> # Iteration 2 collected 65472 pages
> # ......
> # vcpu continues now.
> # vcpu stops because vcpu is kicked out...
> # vcpu continues now.
> # vcpu stops because vcpu is kicked out...
> # Notifying vcpu to continue
> # vcpu continues now.
> # Iteration 31 collected 12642 pages
> # vcpu stops because dirty ring is full...
> # vcpu continues now.
> # Dirtied 7275520 pages
> # Total bits checked: dirty (1165675), clear (866034), track_next (811358)
> ok 3 selftests: kvm: dirty_log_test
> # timeout set to 120
> # selftests: kvm: guest_print_test
> ok 4 selftests: kvm: guest_print_test
> # timeout set to 120
> # selftests: kvm: kvm_binary_stats_test
> # TAP version 13
> # 1..4
> # ok 1 vm0
> # ok 2 vm1
> # ok 3 vm2
> # ok 4 vm3
> # # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0
> ok 5 selftests: kvm: kvm_binary_stats_test
> # timeout set to 120
> # selftests: kvm: kvm_create_max_vcpus
> # KVM_CAP_MAX_VCPU_ID: 256
> # KVM_CAP_MAX_VCPUS: 256
> # Testing creating 256 vCPUs, with IDs 0...255.
> ok 6 selftests: kvm: kvm_create_max_vcpus
> # timeout set to 120
> # selftests: kvm: kvm_page_table_test
> # Testing guest mode: PA-bits:36,  VA-bits:47, 16K pages
> # Testing memory backing src type: anonymous
> # Testing memory backing src granularity: 0x4000
> # Testing memory size(aligned): 0x40000000
> # Guest physical test memory offset: 0xfbfffc000
> # Host  virtual  test memory offset: 0x7fffb0860000
> # Number of testing vCPUs: 1
> # Started all vCPUs successfully
> # KVM_CREATE_MAPPINGS: total execution time: 0.200919330s
> #
> # KVM_UPDATE_MAPPINGS: total execution time: 0.051182930s
> #
> # KVM_ADJUST_MAPPINGS: total execution time: 0.010083590s
> #
> ok 7 selftests: kvm: kvm_page_table_test
> # timeout set to 120
> # selftests: kvm: memslot_modification_stress_test
> # Testing guest mode: PA-bits:36,  VA-bits:47, 16K pages
> # guest physical test memory: [0xfbfffc000, 0xfffffc000)
> # Finished creating vCPUs
> # Started all vCPUs
> # All vCPU threads joined
> ok 8 selftests: kvm: memslot_modification_stress_test
> # timeout set to 120
> # selftests: kvm: memslot_perf_test
> # Testing map performance with 1 runs, 5 seconds each
> # Memslot count too high for this test, decrease the cap (max is 2053)
> #
> # Testing unmap performance with 1 runs, 5 seconds each
> # Memslot count too high for this test, decrease the cap (max is 8197)
> #
> # Testing unmap chunked performance with 1 runs, 5 seconds each
> # Memslot count too high for this test, decrease the cap (max is 8197)
> #
> # Testing move active area performance with 1 runs, 5 seconds each
> # Test took 0.761678900s for slot setup + 5.000014460s all iterations
> # Done 120167 iterations, avg 0.000041608s each
> # Best runtime result was 0.000041608s per iteration (with 120167 iterations)
> #
> # Testing move inactive area performance with 1 runs, 5 seconds each
> # Test took 0.771796550s for slot setup + 5.000018520s all iterations
> # Done 136354 iterations, avg 0.000036669s each
> # Best runtime result was 0.000036669s per iteration (with 136354 iterations)
> #
> # Testing RW performance with 1 runs, 5 seconds each
> # Test took 0.763568840s for slot setup + 5.002233800s all iterations
> # Done 649 iterations, avg 0.007707602s each
> # Best runtime result was 0.007707602s per iteration (with 649 iterations)
> # Best slot setup time for the whole test area was 0.761678900s
> ok 9 selftests: kvm: memslot_perf_test
> # timeout set to 120
> # selftests: kvm: set_memory_region_test
> # Allowed number of memory slots: 32767
> # Adding slots 0..32766, each memory region with 2048K size
> ok 10 selftests: kvm: set_memory_region_test
>
> Tianrui Zhao (4):
>    KVM: selftests: Add KVM selftests header files for LoongArch
>    KVM: selftests: Add core KVM selftests support for LoongArch
>    KVM: selftests: Add ucall test support for LoongArch
>    KVM: selftests: Add test cases for LoongArch
>
>   tools/testing/selftests/kvm/Makefile          |  15 +
>   .../selftests/kvm/include/kvm_util_base.h     |   5 +
>   .../kvm/include/loongarch/processor.h         | 133 +++++++
>   .../selftests/kvm/include/loongarch/ucall.h   |  20 ++
>   .../testing/selftests/kvm/include/memstress.h |  10 +
>   .../selftests/kvm/lib/loongarch/exception.S   |  59 ++++
>   .../selftests/kvm/lib/loongarch/processor.c   | 333 ++++++++++++++++++
>   .../selftests/kvm/lib/loongarch/ucall.c       |  38 ++
>   8 files changed, 613 insertions(+)
>   create mode 100644 tools/testing/selftests/kvm/include/loongarch/processor.h
>   create mode 100644 tools/testing/selftests/kvm/include/loongarch/ucall.h
>   create mode 100644 tools/testing/selftests/kvm/lib/loongarch/exception.S
>   create mode 100644 tools/testing/selftests/kvm/lib/loongarch/processor.c
>   create mode 100644 tools/testing/selftests/kvm/lib/loongarch/ucall.c
>

