Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996961C07
	for <loongarch@lists.linux.dev>; Tue, 21 Feb 2023 09:48:46 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.120])
	by gateway (Coremail) with SMTP id _____8DxE0x8k_RjMhwDAA--.927S3;
	Tue, 21 Feb 2023 17:48:44 +0800 (CST)
Received: from [10.20.42.120] (unknown [10.20.42.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx6r14k_RjH6g3AA--.36064S3;
	Tue, 21 Feb 2023 17:48:40 +0800 (CST)
Subject: Re: [PATCH v2 22/29] LoongArch: KVM: Implement handle idle exception
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20230220065735.1282809-1-zhaotianrui@loongson.cn>
 <20230220065735.1282809-23-zhaotianrui@loongson.cn>
 <06d61407-00b9-812c-e5b3-de585c47ae6b@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn
From: Tianrui Zhao <zhaotianrui@loongson.cn>
Message-ID: <5d7fe795-66b9-7a07-b754-77327886c6c6@loongson.cn>
Date: Tue, 21 Feb 2023 17:48:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <06d61407-00b9-812c-e5b3-de585c47ae6b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx6r14k_RjH6g3AA--.36064S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrZrWDJw1ruFyxWr4DCryxAFb_yoWxurg_Ww
	s3X3Z2kw4UWFsrt3W3CwnIgF43Ga1vqF98urWj9FyUWFnFqFWUWanFg397u397twsxZFZI
	9r18A342kr17XjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO
	n7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
	w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
	jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
	IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
	42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280
	aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0b6pPUUUUU==



在 2023年02月21日 02:40, Paolo Bonzini 写道:
> On 2/20/23 07:57, Tianrui Zhao wrote:
>> +int _kvm_emu_idle(struct kvm_vcpu *vcpu)
>> +{
>> +    ++vcpu->stat.idle_exits;
>> +    trace_kvm_exit(vcpu, KVM_TRACE_EXIT_IDLE);
>
> Please add a separate tracepoint, don't overload trace_kvm_exit().
>
> Likewise for _kvm_trap_handle_gspr().
>
> I think _kvm_trap_handle_gspr() should have a tracepoint whose 
> parameter is inst.word.

Thanks, I will add the tracepoint for _kvm_emu_idle and 
_kvm_trap_handle_gspr.

Thanks
Tianrui Zhao

>
> Paolo
>
>> +    if (!vcpu->arch.irq_pending) {
>> +        kvm_save_timer(vcpu);
>> +        kvm_vcpu_block(vcpu);
>> +    }
>> +
>> +    return EMULATE_DONE;

