Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356F943B6E1
	for <loongarch@lists.linux.dev>; Tue,  7 Jul 2026 17:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783446940; cv=none; b=FGP6fH0hqsENjniCj6a855NfxyRaX9N5OayH/wIITAsMQ30jqHWJPooVpJXrZdE4dHdfo8ALYCqLz70tD5t/MFd2VFL3xQawZB695BvVNBehQvaDeBjyyCe6qkPg7IUd+yfr8b/7TbA7pQaAUGetN5cHMjYxmmMuCODa5v3x4Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783446940; c=relaxed/simple;
	bh=Z6+XLs0Jh9sCn/dl/thX9TYrWOYqd+dH1E3SOpD1BTo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KGR4I5J9lK4ZKFMm/SljLKoHIJZz9tzCB4NHcrf74uD2B4TYW09P59z9pjKGA3fcrLfMpkthG/CekgA6y29zyFIlDwcDPEJU2+NoBNgAFYxQ68DGpOBpfaqjPCSSMRFlDcXXPre7UHdOsgKNIMulYuJLKdmC+TPOenHdW7x+1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouuzsaZs; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouuzsaZs"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so3389924a12.2
        for <loongarch@lists.linux.dev>; Tue, 07 Jul 2026 10:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783446938; x=1784051738; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z6+XLs0Jh9sCn/dl/thX9TYrWOYqd+dH1E3SOpD1BTo=;
        b=ouuzsaZsmbJbIfMOp8aGBeZR6tJfeKhyhvE5Dm6f1NTclT5YYlGdzBXhB8PlebdgbK
         +SUoPBKV2RiZfZXYNtf5u0/9hnTPmZhjq/ttajUHTc9tlRwrxynGIACXBQ+qJK3vylAR
         QKEBswEwA0A4RkObV9VVrGUDX17Yc+NZgmzpIZ6GRg1fgPESFxnP/iQcepgCqyA6eCFt
         IrpwkhpcPjdUGNhjnCROQThn2v3moymcuHEt41sAqWbw/JZIw/NPXHpInFiUz2Hq+ghE
         Vi8lml40LSltwgV+Fi99+AANBzbTv6ntopdojoxLrxiFg7X8Y6bTutmETSh0IcRu5XXh
         pWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783446938; x=1784051738;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6+XLs0Jh9sCn/dl/thX9TYrWOYqd+dH1E3SOpD1BTo=;
        b=D0WgTs4DGnvbs49sCsjeZGjcLfaIYAaQA4DjTuqwZQx8Jw4iQKKUgZrl1iSY3BDe35
         lKDDKyR4VUewvPNWXusKA2R7UVL08FO2IEp21auY//fj1TCaPH6h6UZEym9RUuxRV9qy
         LmJ9kO/ph9IPheMdeFIKcwQEzzON2qPGLmTUvmyXJmlFAUyqnb0wHxxXlkp9ydGbB/J8
         PqSFvMaBctnN+yha5XoXQBk46f1kqFPW+Iky/AbXk2Nus1c10B6z/xLzqoMkOFFdz9qy
         orKfVvrh6V4xTEfjWWcuQvUpf4wWTDIIDXcv5nY6YKUCTEOiRJuK00RAxs9xSPqixgx3
         EFew==
X-Forwarded-Encrypted: i=1; AHgh+Rrf+Ao0SwnkdvIGzqMkWd5K1P3tLnW2e2ukFoMWbPlskgG4xlqONnZTY+ToACwo37wtCfNa0wJrbzA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOjzPngCyQF3R58bCLIkNrdmp03gsvs67MzlvA34lNGvZL7wpx
	EmjwMbmK2mekVKwJ88NBAyREk8YWJNSdG4jveS9mc8HbvX/ya0h89oF+
X-Gm-Gg: AfdE7ckXHE26CsLCiyRkuTEueJAsNpwiRS0TjhTqMUI8V7dstLN8Q93ye8rs0QJK0ai
	j7GcT8OGuJU1NdKiZw53geIoO7cliqRnPV5DbyMejY+1FGvxn/U6BURYXQu8CPKYP0ron7iXL5Z
	dAAcc4rV6xUDr3YZ2eEFAasJBN0Un5ZxJ9wFFMjKLjdEYF1y/r3AJGzQ9+YJOZWpXSn37DTFk0t
	V2X2/hTa7dl6ezn+ea+Y5CO6kSN+lCASjpOnoHGOyl3BVOmFm5JpNK2VJrQLG+1p82o5yqfRE/x
	zw6aehOZ8BhDcs719MlTVGY9Y3vCPb4280GnC5FnU8Mw5tKFMDmmYBM9C8HVc0o462G0CYt1JHD
	dpp87qt/k0fpkP/63wi61AXajyAHk29rJAhfdyOddEtfDzc/mzrB3bDhBxrYqH+VgwWC3FeKUDO
	1tL5FJI1URc5m/1WWv3ckanjytxtQoHwTWJ6dZ2VwfIZZ1SNI/pzjKUeG1voZP36u3dtUe
X-Received: by 2002:a05:6a20:d495:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3c08ecb17f7mr7407132637.17.1783446938434;
        Tue, 07 Jul 2026 10:55:38 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:471b:7d0d:285:8a95? ([2620:10d:c090:500::3:70d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm11265443eec.13.2026.07.07.10.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:55:38 -0700 (PDT)
Message-ID: <792983909e60289981e08026fe810e03a73f4f73.camel@gmail.com>
Subject: Re: [PATCH bpf-next v8 2/2] bpf: Reject programs with inlined
 helpers if JIT is not available
From: Eduard Zingerman <eddyz87@gmail.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>, Martin
 KaFai Lau <martin.lau@linux.dev>, Song Liu	 <song@kernel.org>, Yonghong
 Song <yonghong.song@linux.dev>, Jiri Olsa	 <jolsa@kernel.org>, Emil
 Tsalapatis <emil@etsalapatis.com>, KaFai Wan	 <kafai.wan@linux.dev>
Cc: bpf@vger.kernel.org, loongarch@lists.linux.dev, Leon Hwang
	 <leon.hwang@linux.dev>, Puranjay Mohan <puranjay@kernel.org>, 
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?=
	 <bjorn@kernel.org>
Date: Tue, 07 Jul 2026 10:55:35 -0700
In-Reply-To: <450340cb-26a4-d3b2-4861-3016f0a08b13@loongson.cn>
References: <20260706040006.10331-1-yangtiezhu@loongson.cn>
	 <20260706040006.10331-3-yangtiezhu@loongson.cn>
	 <abd697d839043d80e0230d2b9ab30b214dfa34d7.camel@gmail.com>
	 <33d3eb99-ef5a-5413-b2f6-3217b54cce4d@loongson.cn>
	 <cab476b7a3e205164d43f791d84b0e0b8101d974.camel@gmail.com>
	 <450340cb-26a4-d3b2-4861-3016f0a08b13@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-07-07 at 18:39 +0800, Tiezhu Yang wrote:

[...]

> Hi Eduard,
>=20
> Sorry for the misunderstanding.
> Your wrapper handles the load-time JIT-disabled case nicely.
>=20
> The problem is, it cannot protect against the case where JIT
> is enabled during verification but dynamically fails later.
>=20
> In that scenario, the verifier would have already skipped the
> rewrite based on the wrapper, and the fallback to interpreter
> would still trigger the kernel panic.

I'm not sure I understand what you mean. The decision on whether to
use jit for a specific program should be taken at the beginning of the
load system call processing. bpf_prog_alloc_no_stats() sets the
fp->jit_requested before the bpf_check() call in core.c:bpf_prog_load()
and that should be a final say.

At no point the program should be processed with bpf_check() assuming
that jit is enabled and runtime is selected assuming that jit is
disabled. If there are such instances now, these should be addressed.

> By using the 'jit_required' flag, we can cleanly catch both
> cases, and reject early or return -ENOTSUPP at runtime.
>=20
> Please see the test log for the detailed fallback behaviors:
> https://lore.kernel.org/loongarch/aa26b3fc-9717-4273-dd76-a0dd6b15ff61@lo=
ongson.cn/
>=20
> Since you mentioned it "might as well land as-is", I will
> proceed with v9 using this flag architecture.
>=20
> Thanks,
> Tiezhu
