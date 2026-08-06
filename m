Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B36E2222AA
	for <loongarch@lists.linux.dev>; Thu,  6 Aug 2026 12:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786020392; cv=none; b=r0B0+r/Uw9Wg7AVN32juLAiq5TJ5HFNuL1soVWSh7VdRSTTOJ+kN2q7E0az7WYyI8EwTs+OKhdmTdsPt7wpcwt34+8F4vdXa76WXZKNMmnZ1EuRgT7T86SLozVKKl1nhT0ALbDPQz5gbCpwkcFlVvJ06DUHrr5MINBc37rkaCuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786020392; c=relaxed/simple;
	bh=3G4OekyjL/VrOkpAWor6znjvPqfEKokO7y4mxTy5veo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=NwnpfvkDn347cLbOtV6UrjKC1Bt2rvjziCf+bA2BA6JJIExTDU1tVGt1xphtEjIrtOuLM6xXHeBOzga1dmFbQe4xkFv/cxn5f6dYh1ZyNIaD1b7jN7CwwRAjKt99deSdgK18SAhCjZ97LzvED+02g+2UnrBdo24bDD04+73ZAxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Dxk+gfgnRqEP0KAA--.12088S3;
	Thu, 06 Aug 2026 20:46:23 +0800 (CST)
Received: from [10.130.40.83] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxPcUbgnRqscslAA--.6546S2;
	Thu, 06 Aug 2026 20:46:20 +0800 (CST)
Subject: Re: [PATCH v4 4/4] selftests/bpf: Add kptr-xchg benchmark
To: Chenguang Zhao <chenguang.zhao@linux.dev>, chenhuacai@kernel.org,
 kernel@xen0n.name, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com
Cc: hengqi.chen@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, shuah@kernel.org, loongarch@lists.linux.dev,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Chenguang Zhao <zhaochenguang@kylinos.cn>
References: <20260729022837.355549-1-chenguang.zhao@linux.dev>
 <20260729022837.355549-5-chenguang.zhao@linux.dev>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <e78c2c5c-e261-387b-c1c0-cd7f97915e08@loongson.cn>
Date: Thu, 6 Aug 2026 20:46:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260729022837.355549-5-chenguang.zhao@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxPcUbgnRqscslAA--.6546S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GryfXF1fZryUWr4rtrW3CFX_yoWkAFcE9w
	48X34kG3y8AF4xCFW0yr13WayY93yYgrZ0qF9rJr1UtFW7WFs8JF4DGw4Fgas5WrZ5Grya
	yan5XFyFyrWavosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbqkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j7189UUU
	UU=

On 2026/7/29 上午10:28, Chenguang Zhao wrote:
> From: Chenguang Zhao <zhaochenguang@kylinos.cn>
> 
> Add a bpf selftest benchmark that exercises bpf_kptr_xchg() in a tight loop
> so helper vs inlined JIT paths can be compared on supported architectures.
> 
> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
>   tools/testing/selftests/bpf/Makefile          |  2 +
>   tools/testing/selftests/bpf/bench.c           |  2 +
>   .../selftests/bpf/benchs/bench_kptr_xchg.c    | 96 +++++++++++++++++++
>   .../selftests/bpf/progs/kptr_xchg_bench.c     | 49 ++++++++++
>   4 files changed, 149 insertions(+)
>   create mode 100644 tools/testing/selftests/bpf/benchs/bench_kptr_xchg.c
>   create mode 100644 tools/testing/selftests/bpf/progs/kptr_xchg_bench.c

Hi Chenguang,

Please send this generic selftest patch to the BPF mailing list.
It should be routed through the bpf-next tree.

Also, please use the '[PATCH bpf-next]' subject prefix to specify
that this is destined for the bpf-next tree.

For more info, please see:
https://www.kernel.org/doc/html/latest/bpf/bpf_devel_QA.html

Thanks,
Tiezhu

