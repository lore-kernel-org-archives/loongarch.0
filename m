Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3613B2AA
	for <loongarch@lists.linux.dev>; Sun, 30 Aug 2026 01:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788054411; cv=none; b=VE6LE+4G6qKDC7Cr7s0yFp3kibBB4yiR8yuiwK33rn1T7tSN2A6KTqt7PIMfuw9uPx5kOee7ehXM+olgNCSorGtIFpTwUy8qG+F5+9gLJlPNWSyAY2J2+wc+qPHoKSP2wayU3yY/DRVzT/n17em1CDOWEfZVHeA38LFNZCjb2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788054411; c=relaxed/simple;
	bh=QM2jxYJvxilDMTefmjax2O9VyCgr0nOIsZolvMYW2C0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=imGYU6F1+qjGJTYe0LCqi7pkJrIY01xuu94BdktvjkDEC3WoKRvE27SicNJ9cEtjNL2zk//EhY1Kx62V9jd6jiDKHGx4J51jyROMJ78apeSboJq3mKxutpcLLmdxTde0wwDP1fkITic/kP5N+Ult3y8rbCl/EFpkdnJ1wP3YBq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eG54W5+R; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eG54W5+R"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-499c930cb9cso4554335e9.0
        for <loongarch@lists.linux.dev>; Sat, 29 Aug 2026 18:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788054408; x=1788659208; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CtUZUG5479myEUIwKmrKmHPQvtvtyLa9hp4A2ascPYs=;
        b=eG54W5+Ret2X43YSvtdLvHehrRmPx9A0tunlPRwKflo4OAgRmP5sYBEqdJwSRC1IMC
         OPJR5R6RL5F+PHq40EeUucZZO7Toj2TkK9/8VPUcKb4iCQ+y2i/1clPCqTHYdnrqwByF
         fqf0kQiBepDS++y+j6pZ9U3npB+FGoAWA3h+cP2mdgqFDP3ZshS7kTk9Xp0Nd4g3+6Cy
         O4N6HoZb1IU+yY3z8q0VQO8xTrIjMNsqa/iNPl74t2yFOVkkcVmGboNt5Xore51bQzsr
         qlzQagi3ek+VDlL5TYzMmXgqkKN1DLcnT/23rzhyptmW+kPHHPFHzGPEe+OKUgfBMc61
         NS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788054408; x=1788659208;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtUZUG5479myEUIwKmrKmHPQvtvtyLa9hp4A2ascPYs=;
        b=TvManbGpPkKEevUpZPEsUkmIbnT0yBh7Qge33XMUbPDJ1WzgQ1egZF+k7CChsty84b
         BoDvPIXH3ms1biQc3JSnGdfhLl70dq4K2I+KFB9daCrJ8+bB+El1U2Nsfxz2SkyTALqk
         BdNixlZFU3zW9aPlbp/uL51NjEyMT+iFlOX7clhJV0WoIBEGMc00gK/YrBbBLYSfxwoR
         7fTICxHYL/+U2lljRK/Zz4gN5Zu8SrWSjvn/MLEe2nEISMx6Ho4It2FTd4ty2QHlq4LC
         SXvV+2n78kJDCG32XeRgTKrPOUYpYrs0YPmjVjnIDSVo3pCv1N+L7GBlsVdA8ppoVRBz
         GVqw==
X-Forwarded-Encrypted: i=1; AKwUvBxpM7YaL0hd1/TJpDJWnJ5fADUApY41sKrul8zWo5fJvBbSCXvfDpgAQU62AKO0W3d36GNCC9sXFCg=@lists.linux.dev
X-Gm-Message-State: AFuF++nyfS5JhynL0pjoE+hP3hZSrAtV8lIpsURP2WlrIZTwe8dife9i
	zJ54LtvkO68RvmFFWqOxbeYvA9Jd7cfrFj81DjRA6gMklEWu/bBl/fV2
X-Gm-Gg: AYBFou2HIHRwUcFWtdU5NLNy/UU+1WjatSjE3VkPEdmLFQYRiqMVPPbncjjMVlK24xr
	Y5YCaYwTwY9FLdXLeadTOdRM1PLEywk073ezdUGdeiC+0kNtf2UXBxY7iUS2m2zgkJOqdZCYqPT
	Y/a+d3hxvn1R8Y3eOgewUCl+xPlD236b/TcbODDeyFQ2AsRi8UEGXmBhl1WMwFcS9FASOS1ao7Y
	uesgkxja5qrvWeLcvufQlKx1ff4kZZaFnxxNZ5FUJ/F4ZR2J+iaSIA/4JdTnx95L0T8NO2kIfHJ
	0jVCSiDEGNVaPnBc9t+Fy0Xxcw2WzfwIYdHPCJ4T8VHDVmEERNleGYjzAODNagaZ1hKBuVdbDvX
	XnWkD5tKWFyoTjZf+qqPFvjkJxFhWt48aTXFhnDucPyeJX2gEhjA0htIGIiJsmpC8qKkjKpWSH6
	mAd09vkvonw2bWD2j/EBhzjRUTjBOdI82E/cCbvz1zZLurF5hWtVHqjyqCcvmTGxN7PGl82k4ti
	pIwlBUopAZTFE9cFdLkfNAwEX1iagyHDP/kGtV6xSQ8lgPoGzCsjTimBy1GFjraDBwZC0JwX7aC
	TBu/u3qWniVC6PtG8dXLGFud2HbJQBZ2E9oVvw==
X-Received: by 2002:a05:6000:2287:b0:484:3310:f399 with SMTP id ffacd0b85a97d-4843310f41cmr6549348f8f.26.1788054407564;
        Sat, 29 Aug 2026 18:46:47 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2794dsm13697009f8f.25.2026.08.29.18.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 18:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 30 Aug 2026 03:46:46 +0200
Message-Id: <DL1WDYI57AAF.Q8T6RDYE04J2@gmail.com>
Cc: "Huacai Chen" <chenhuacai@kernel.org>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Eduard Zingerman" <eddyz87@gmail.com>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <kkd@meta.com>, <kernel-team@meta.com>,
 <loongarch@lists.linux.dev>, "Hengqi Chen" <hengqi.chen@gmail.com>
Subject: Re: [PATCH bpf-next v1 07/14] bpf, loongarch: Fix stack arguments
 for indirect trampolines
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260821233516.3426127-1-memxor@gmail.com>
 <20260821233516.3426127-8-memxor@gmail.com>
 <a5d4c26c-6735-8af1-1d3f-fe7f1898b285@loongson.cn>
 <DL0B54EEQXAL.FL6Z0UXMR3SX@gmail.com>
 <2bc45d20-d08f-e5c1-9da3-699d22959f98@loongson.cn>
In-Reply-To: <2bc45d20-d08f-e5c1-9da3-699d22959f98@loongson.cn>

On Fri Aug 28, 2026 at 10:19 AM CEST, Tiezhu Yang wrote:
> On 2026/8/28 =E4=B8=8B=E5=8D=8812:55, Kumar Kartikeya Dwivedi wrote:
>> On Fri Aug 28, 2026 at 6:33 AM CEST, Tiezhu Yang wrote:
>
> ...
>
>>> With this patch:
>>>
>>>     $ sudo ./test_progs -t struct_ops_trampoline
>>>     #471     struct_ops_trampoline:OK
>>>     Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
>>>
>>> Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>
>> Thanks a lot for the test. Please also take a look at the argument rebas=
e
>> patches once you folks have more cycles. Will definitely need your help =
and
>> reviews since they are mostly vibe coded.
>
> Hi Kumar,
>
> I have sent a standalone prerequisite fix for the pre-existing
> issue:
>
> LoongArch: BPF: Fix off-by-one error for insn_is_cast_user
> https://lore.kernel.org/loongarch/20260828075100.24776-1-yangtiezhu@loong=
son.cn/
>
> IMO, when you respin, please rebase your patches 07, 08, and 09
> on top of this fix for your v2 series.
>
> Additionally, please send the v2 as a standalone series to the
> loongarch mailing list loongarch@lists.linux.dev and the reviewer
> Hengqi Chen <hengqi.chen@gmail.com> too, as the LoongArch BPF JIT
> patches are typically routed through the loongarch-next tree.
>
> https://lore.kernel.org/loongarch/CAAhV-H55YcyXRewC+0YzTHXb1jab0GkAV13EF9=
nFbTx=3DUkX4ww@mail.gmail.com/
>

Ok, I will send v2 without loongarch changes and then split out and send th=
em
separately later on (or let me know if you'd like to commandeer them, I'm h=
appy
to do it either way).

Thanks
