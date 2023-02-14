Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20D727721
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 13:00:53 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.120])
	by gateway (Coremail) with SMTP id _____8AxbdoDhutjEIgAAA--.1601S3;
	Tue, 14 Feb 2023 21:00:51 +0800 (CST)
Received: from [10.20.42.120] (unknown [10.20.42.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxyr0ChutjydoyAA--.29297S3;
	Tue, 14 Feb 2023 21:00:51 +0800 (CST)
Subject: Re: [PATCH v1 01/24] LoongArch: KVM: Implement kvm module related
 interface
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230214025648.1898508-1-zhaotianrui@loongson.cn>
 <20230214025648.1898508-2-zhaotianrui@loongson.cn>
 <Y+ssT+W27GxDRAAZ@kroah.com>
 <6fd2ca5a-7243-0627-79e9-8c8bd840adc2@loongson.cn>
 <Y+tbMwXjA0hkiUJA@kroah.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
From: Tianrui Zhao <zhaotianrui@loongson.cn>
Message-ID: <a44fc722-e3e2-7f8a-0454-f27a8a10d52b@loongson.cn>
Date: Tue, 14 Feb 2023 21:00:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y+tbMwXjA0hkiUJA@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bxyr0ChutjydoyAA--.29297S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7JFy8XFWUAFyfJF17CryDZFb_yoWfuFc_Cr
	17Jr4Du3y5GF45Ka1DGFs0kFWxG3W5Ga4Iqrs8Kry3urnrXF48Ca1kG34kZFW3Kw4xKr4I
	9wn5tFW8XwsFqjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	C7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWln4kS
	14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
	67AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07jFa0PUUUUU=



在 2023年02月14日 17:58, Greg Kroah-Hartman 写道:
> On Tue, Feb 14, 2023 at 05:00:56PM +0800, Tianrui Zhao wrote:
>>>> +#define KVM_GET_CSRS		_IOWR(KVMIO, 0xc5, struct kvm_csrs)
>>>> +#define KVM_SET_CSRS		_IOW(KVMIO,  0xc6, struct kvm_csrs)
>>> Why does this arch need new ioctls?
>> We want to use this ioctl to access multiple csrs at one time. If without
>> this, we only access one csr.
> What is wrong with accessing only one csr at a time?  Isn't this what
> other architectures do?

Generally, using KVM_GET_ONE_GET ioctl to get one reg, but we want a
more convenient interface to get serial regs at one time, so we add this
ioctl.
And in x86 platform, using KVM_GET_MSRS to access multiple registers. and
our functions reference this.

Thanks,
Tianrui Zhao

>
>> There is another function, can we use the KVM_GET/SET_MSRS to access our
>> csrs?
> I do not know, that's up to the KVM developers to answer.
>
> thanks,
>
> greg k-h

