Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C547127721
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 13:05:42 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8Axadklh+tjbIgAAA--.1341S3;
	Tue, 14 Feb 2023 21:05:41 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxzr4kh+tjU9syAA--.40049S3;
	Tue, 14 Feb 2023 21:05:40 +0800 (CST)
Message-ID: <c028b3bd-7f42-49d3-b811-fca680bf86ac@loongson.cn>
Date: Tue, 14 Feb 2023 21:05:40 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 01/24] LoongArch: KVM: Implement kvm module related
 interface
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20230214025648.1898508-1-zhaotianrui@loongson.cn>
 <20230214025648.1898508-2-zhaotianrui@loongson.cn>
 <Y+ssT+W27GxDRAAZ@kroah.com>
 <6fd2ca5a-7243-0627-79e9-8c8bd840adc2@loongson.cn>
 <Y+tbMwXjA0hkiUJA@kroah.com>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <Y+tbMwXjA0hkiUJA@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bxzr4kh+tjU9syAA--.40049S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7JFy8XFWUAFyfJF17CryDZFb_yoWfJFX_ur
	s7Aa1Du3y8GFs3Kan0yF909FWxC3W5Ga40qrs8GFWS93s8Xa1xAFs7WrZ2vFn0ga1SyFs3
	u3sYgFWUX39rXjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	k7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjxUcVc_UUUUU



在 2023/2/14 17:58, Greg Kroah-Hartman 写道:
> On Tue, Feb 14, 2023 at 05:00:56PM +0800, Tianrui Zhao wrote:
>>>> +#define KVM_GET_CSRS		_IOWR(KVMIO, 0xc5, struct kvm_csrs)
>>>> +#define KVM_SET_CSRS		_IOW(KVMIO,  0xc6, struct kvm_csrs)
>>> Why does this arch need new ioctls?
>> We want to use this ioctl to access multiple csrs at one time. If without
>> this, we only access one csr.
> 
> What is wrong with accessing only one csr at a time?  Isn't this what
> other architectures do?
It is ok to access CSR register once at a time, the other platforms do this
except x86 platform. Only that I think that batch method is better such as
KVM_GET/SET_MSRS ioctl cmds in x86. 

Regards
Bibo, Mao
> 
>> There is another function, can we use the KVM_GET/SET_MSRS to access our
>> csrs?
> 
> I do not know, that's up to the KVM developers to answer.
> 
> thanks,
> 
> greg k-h

