Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795741970;
	b=hRCuqCKbBBwzY09a67TXJSsR23b08ZB1yhafruo/57HJvbTzF1MvWgzPn9X/OoV1XHWc
	 Tbr687I2IqVi4g8yAQ4fDprJMC73eSN+M+eERjMqYZ1b22uRYVnxQrhsNB6dZV+QXMeKy
	 GEs+219khLMpH+oFUealcHWQpDAwdnOSsrmMbzJIE6ekwihpQyXaL+kx84zbS5/RP5twO
	 sExx/DoR17Zlfr2001qxX4Hh7uI5pfAAvArkOfyjyIojyD7D50PxifgiIDddVsFVtWX68
	 YJ3b8/3Coz2x3XxNOZt+k04s+WwLEBW2lwPGXKpcrRlCr1rwA3GPemJujP/yplH+z+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795741970;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=WL6jcyaBgXtjlwf2xKoJMQ4E9Qb5FW6oej1sKLlt6UI=;
	b=oo/xtqk6V+vgUikiqI70O1p0IIOLIJMOurT2VihwDyTxv+jrkEbvA53HdEe63XI5l7cd
	 lapUtuy4RDSv1/eH3L7wci8N4SLQIKNKr+Fa/jOl14dtkiu0Q1InaVR94sDezSURSLHCx
	 tlirbH1gMQKzCPUUY/BeXtv1zkj9eSXjqrfpOvswLRQCZP9QK9BnILyEuidNEaxaRttyM
	 FiGRHbVJdx4eDbr23z3zRmWong85veIwRv06HiKxmYU9dw3R3BwsjgHKw8hox/5zmHZ0V
	 Uo6vS7k6Tuxa0b5QMIuWa/5WmBLhSY0H4JDduKeTee3gItKiaI+j/2QBwGi+CMwtlPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF1E606A326
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 01:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF1E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxPNIH2Qhr1WcjAA--.35101S3;
	Fri, 27 Nov 2026 09:12:39 +0800 (CST)
Received: from [127.0.0.1] (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJCxf88F2Qhr3ac3AA--.46655S2;
	Fri, 27 Nov 2026 09:12:37 +0800 (CST)
Subject: Re: [PATCH v2 0/2] KVM: LoongArch: selftests: MAINTAINERS coverage
 and a VM leak
To: Gokul K <gokul02k@gmail.com>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kselftest@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
References: <20261126050352.1957454-1-gokul02k@gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <b5d4b059-6561-a68c-e00d-247566a081f8@loongson.cn>
Date: Fri, 27 Nov 2026 09:13:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261126050352.1957454-1-gokul02k@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxf88F2Qhr3ac3AA--.46655S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uF13KF4kurW5Cw48Gr1fZrc_yoW8Ar1kpa
	yfu3ZFyr1vgFs7Ga1qk34jg3ZxXFnrJF1xZ3Z0k34Uurs8Zry8Xrn29r4DXa4DZ39YgFWS
	ga1Ska4Fga1DXacCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UU
	UUU==

On 2026/11/26 下午1:03, Gokul K wrote:
> Two small fixes to the LoongArch KVM selftests. Patch 2 frees the VM on
> the PMU test's skip path. Patch 1 came out of routing it:
> get_maintainer.pl did not name the LoongArch KVM maintainers for
> tools/testing/selftests/kvm/loongarch/, because the MAINTAINERS entry
> does not cover that directory, so this series would otherwise have
> gone to Paolo, Sean and Shuah only.
> 
> Based on loongarch-kvm in linux-loongson.git.
> 
> Patch 2's hunk sits next to the one in "KVM: selftests: Convert comma
> to semicolon" [1], which is not applied yet. They do not overlap and
> apply in either order.
> 
> Compile-tested only. Patch 2 builds: tools/testing/selftests/kvm/loongarch/
> pmu_test links for loongarch64 with a GCC 15.2.1 cross compiler, using
> glibc from Debian's loong64 port as the sysroot. The binary was not run.
> Patch 2 changes the PMU-not-enabled skip path, which only runs on a
> LoongArch host whose VM config leaves the PMU off.
> 
> Changes in v2:
> - 1/2: also drop the lib/loongarch/ line, which */loongarch/ already
>    covers, so the entry matches the other arches (Zenghui Yu)
> - 2/2: unchanged
> 
> v1: https://lore.kernel.org/all/20261123100701.1679376-1-gokul02k@gmail.com/
> 
> [1] https://lore.kernel.org/all/20260428053204.1018608-1-nichen@iscas.ac.cn/
> 
> Gokul K (2):
>    MAINTAINERS: Add the LoongArch KVM selftests directory
>    KVM: LoongArch: selftests: Free the VM when the PMU test skips
> 
>   MAINTAINERS                                      | 2 +-
>   tools/testing/selftests/kvm/loongarch/pmu_test.c | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
For this series.
Reviewed-by: Bibo Mao <maobibo@loongson.cn>

