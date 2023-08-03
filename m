Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA97446A7
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 03:15:55 +0000 (UTC)
Received: from loongson.cn (unknown [10.40.46.158])
	by gateway (Coremail) with SMTP id _____8DxBfHiG8tkFm8PAA--.36062S3;
	Thu, 03 Aug 2023 11:15:47 +0800 (CST)
Received: from [192.168.124.126] (unknown [10.40.46.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLCPgG8tkAZNGAA--.32394S3;
	Thu, 03 Aug 2023 11:15:44 +0800 (CST)
Subject: Re: [PATCH v1 0/4] selftests: kvm: Add LoongArch support
To: Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Vishal Annapurve <vannapurve@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, Peter Xu <peterx@redhat.com>,
 Vipin Sharma <vipinsh@google.com>, maobibo@loongson.cn
References: <20230801020206.1957986-1-zhaotianrui@loongson.cn>
 <ZMqLKAWRapQjGgWR@google.com>
From: zhaotianrui <zhaotianrui@loongson.cn>
Message-ID: <66eb2e6c-7d16-6fbf-7deb-f6d821b1cd8c@loongson.cn>
Date: Thu, 3 Aug 2023 11:14:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZMqLKAWRapQjGgWR@google.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8CxLCPgG8tkAZNGAA--.32394S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF1kuw4fGF1Dtw4xCw48AFc_yoW8uw1rpa
	9akF4FkFs7KF1IyF93J397Xr1Fya1kGr42v3WSqryUZw47try8Jr1xKFZ2kFy3u34kWr1F
	vas7KwnxW3WUXagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcveHDUUUU


ÔÚ 2023/8/3 ÉÏÎç12:58, Sean Christopherson Ð´µÀ:
> Please use "KVM: selftests:" for the scope.  There's no "official" requirement,
> but I've been heavily pushing "KVM: selftests:" and no one has objected or
> suggested an alternative, and I'd really like all of KVM selftests to use a
> consistent scope.
Thanks for your reviewing.
I will replace all the "selftests: kvm:" with "KVM: selftests:".
>
> On Tue, Aug 01, 2023, Tianrui Zhao wrote:
>> This patch series base on the Linux LoongArch KVM patch:
>> Based-on: <20230720062813.4126751-1-zhaotianrui@loongson.cn>
> Is there an actual dependency?  I ask because I'm shepherding along a series[*]
> that will silently conflict with the ucall support, and in a way with the Makefile
> changes.
Yes, this KVM selftests patch series actually depend on the previous 
LoongArch KVM patches.

Thanks
Tianrui Zhao
>
> If there's no hard dependency, one option would be take this series through
> kvm-x86/selftests (my topic branch for KVM selftests changes) along with the
> guest printf series, e.g. so that we don't end up with a mess in linux-next and/or
> come the 6.6 merge window.
>
> https://lore.kernel.org/all/20230731203026.1192091-1-seanjc@google.com
>
>>   tools/testing/selftests/kvm/Makefile          |  11 +
>>   .../selftests/kvm/include/kvm_util_base.h     |   5 +
>>   .../kvm/include/loongarch/processor.h         |  28 ++
>>   .../selftests/kvm/include/loongarch/sysreg.h  |  89 +++++
>>   .../selftests/kvm/lib/loongarch/exception.S   |  27 ++
>>   .../selftests/kvm/lib/loongarch/processor.c   | 367 ++++++++++++++++++
>>   .../selftests/kvm/lib/loongarch/ucall.c       |  44 +++
>>   7 files changed, 571 insertions(+)
>>   create mode 100644 tools/testing/selftests/kvm/include/loongarch/processor.h
>>   create mode 100644 tools/testing/selftests/kvm/include/loongarch/sysreg.h
>>   create mode 100644 tools/testing/selftests/kvm/lib/loongarch/exception.S
>>   create mode 100644 tools/testing/selftests/kvm/lib/loongarch/processor.c
>>   create mode 100644 tools/testing/selftests/kvm/lib/loongarch/ucall.c
>>
>> -- 
>> 2.39.1
>>

