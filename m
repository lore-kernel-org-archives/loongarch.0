Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1867C
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 09:01:08 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.120])
	by gateway (Coremail) with SMTP id _____8CxxtjKTetj3nMAAA--.645S3;
	Tue, 14 Feb 2023 17:00:58 +0800 (CST)
Received: from [10.20.42.120] (unknown [10.20.42.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axeb3ITetjQMIyAA--.29053S3;
	Tue, 14 Feb 2023 17:00:56 +0800 (CST)
Subject: Re: [PATCH v1 01/24] LoongArch: KVM: Implement kvm module related
 interface
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230214025648.1898508-1-zhaotianrui@loongson.cn>
 <20230214025648.1898508-2-zhaotianrui@loongson.cn>
 <Y+ssT+W27GxDRAAZ@kroah.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
From: Tianrui Zhao <zhaotianrui@loongson.cn>
Message-ID: <6fd2ca5a-7243-0627-79e9-8c8bd840adc2@loongson.cn>
Date: Tue, 14 Feb 2023 17:00:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y+ssT+W27GxDRAAZ@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axeb3ITetjQMIyAA--.29053S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWrWxAF47KF1xuw15tw4kXrb_yoW5Ar4xpF
	WDAFn5KF4rGr1fGwnaq3Wagrn8GFykGF47K3W293yUAFWjqw1UCr4kK3sIva4jva1kXr10
	gF13X3WYg3ZFy37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
	e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
	xVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JbIYCTnIWIevJa73UjIFyTuYvjxU2MKZDUUUU



在 2023年02月14日 14:38, Greg Kroah-Hartman 写道:
> On Tue, Feb 14, 2023 at 10:56:25AM +0800, Tianrui Zhao wrote:
>> 1. Implement loongarch kvm module init, module exit interface,
>> using kvm context to save the vpid info and vcpu world switch
>> interface pointer.
>> 2. Implement kvm hardware enable, disable interface, setting
>> the guest config reg to enable virtualization features.
>> 3. Add kvm related headers.
> Shouldn't this be 3 different patches instead?
Thanks, I will separate this to 3 different patches.
>
>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/cpu-features.h |  22 ++
>>   arch/loongarch/include/asm/kvm_host.h     | 257 ++++++++++++++++++++++
>>   arch/loongarch/include/asm/kvm_types.h    |  11 +
>>   arch/loongarch/include/uapi/asm/kvm.h     | 121 ++++++++++
>>   arch/loongarch/kvm/main.c                 | 152 +++++++++++++
>>   include/uapi/linux/kvm.h                  |  15 ++
>>   6 files changed, 578 insertions(+)
>>   create mode 100644 arch/loongarch/include/asm/kvm_host.h
>>   create mode 100644 arch/loongarch/include/asm/kvm_types.h
>>   create mode 100644 arch/loongarch/include/uapi/asm/kvm.h
>>   create mode 100644 arch/loongarch/kvm/main.c
>>
>> diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/include/asm/cpu-features.h
>> index b07974218..23e7c3ae5 100644
>> --- a/arch/loongarch/include/asm/cpu-features.h
>> +++ b/arch/loongarch/include/asm/cpu-features.h
>> @@ -64,5 +64,27 @@
>>   #define cpu_has_guestid		cpu_opt(LOONGARCH_CPU_GUESTID)
>>   #define cpu_has_hypervisor	cpu_opt(LOONGARCH_CPU_HYPERVISOR)
>>   
>> +#define cpu_has_matc_guest	(cpu_data[0].guest_cfg & (1 << 0))
>> +#define cpu_has_matc_root	(cpu_data[0].guest_cfg & (1 << 1))
>> +#define cpu_has_matc_nest	(cpu_data[0].guest_cfg & (1 << 2))
>> +#define cpu_has_sitp		(cpu_data[0].guest_cfg & (1 << 6))
>> +#define cpu_has_titp		(cpu_data[0].guest_cfg & (1 << 8))
>> +#define cpu_has_toep		(cpu_data[0].guest_cfg & (1 << 10))
>> +#define cpu_has_topp		(cpu_data[0].guest_cfg & (1 << 12))
>> +#define cpu_has_torup		(cpu_data[0].guest_cfg & (1 << 14))
>> +#define cpu_has_gcip_all	(cpu_data[0].guest_cfg & (1 << 16))
>> +#define cpu_has_gcip_hit	(cpu_data[0].guest_cfg & (1 << 17))
>> +#define cpu_has_gcip_secure	(cpu_data[0].guest_cfg & (1 << 18))
> Why not use BIT() for all of those "<<" statements?
Ok thanks, I will use BIT() to replace those "<<" statements.
>
>> +#define KVM_GET_CSRS		_IOWR(KVMIO, 0xc5, struct kvm_csrs)
>> +#define KVM_SET_CSRS		_IOW(KVMIO,  0xc6, struct kvm_csrs)
> Why does this arch need new ioctls?
We want to use this ioctl to access multiple csrs at one time. If 
without this, we only access one csr.
There is another function, can we use the KVM_GET/SET_MSRS to access our 
csrs?

Thanks,
Tianrui Zhao
> thanks,
>
> greg k-h

