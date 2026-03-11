Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D812C21E8
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 16:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245528; cv=none; b=eiHeMPloSS3oak+epbuJZSFkqTg0Exvh3VWLKQU47F0EIkQCeTusFqsnU7loftHo+G4vhh5rYIBGGCSza7w9ukSBJGOknp/6u2AJataOsekGPsbDxZ44nSk1YU3dU0wY04hH25Ue+7ejMN1CHSW0VQHYs2BfrVgKb/6CC+xGiMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245528; c=relaxed/simple;
	bh=sIyQNwqOjKVpIIiV25yy7lDLknlNRxzQ9aI/FW1l/Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUcx5fwG8NtwteaiibXwApEdb5lYWNS10K8nhTphVwHm74GLQd474mV0vHR+FKqzUsFnVG/gYXtlIdWwp/6UUY+EMqqtJhmpQpJfqaNTRQ6ytk4iWUSTe7Ufr+j65kkXD6mEcbEAlVXmiytFgTAH1olNcbgpqaR0wlMNp9OemWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRej2goz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRej2goz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439cb5af25bso51906f8f.1
        for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773245525; x=1773850325; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K53abmcm+HGCYf9w3e1yImH3op/t1XPxWRmPDq4zpG8=;
        b=kRej2gozrrkHFXZnBTU2xULvFN72vV67mDbwSMyRQAyOy5RzXC1zksodWmZUew4lMu
         rONLooI8zPNNurTQ0zuwJGDVvejlvaji32KOz+SN6efXC6NOzzXT9BuYdNIkeitj3/37
         M7N2Zwu0RUtwZiha5LzOETzzlWcf8pFNoImGOTR+lCeV1CA5b9dGnnNQXRpQy3XxJ6hm
         fdkZ+UwA06J+YCwwpvUCeUutw59PsLqtPHT8SQUE9FB+aXwwr/wGwkLC2jBC+VPFczpg
         pRe/9EpSDAz7ZLM5h0uvvOyRd3/8EQFaH7gZbBrBHdRjS9rCz/mccFnD1A5HRMDg/5vh
         fmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245525; x=1773850325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K53abmcm+HGCYf9w3e1yImH3op/t1XPxWRmPDq4zpG8=;
        b=p7q+UfqMmtlVEJztEpbFvrYFWvzJ5mPQz0gNVA6kqDLjhSwtmT2iuGCT/QZVRITtsR
         r07ObU/lD3W4EfBcPiY6hXMGqOMTEej6zi7MFTSZEdVY27rC14nYg7oHg0eDu+B26kRT
         VfoNke2cmW+JYhD0t/rB/AZx8F1fN4HtmBSMd3uhaickkSYblab5HL5rIv4YkN8NP6Fz
         Zsst6SKvnAcYED6a5N+E7UWzyd1fqFyzQmdLegbZFUzwBC9aIQpl7t8RQOIh64LvvLoF
         pX/o9Je0hgx4KHuaRKMOn02z7MEGjDg4idje1+L5hFjAloL/7QaUDF8QJ7LnZFuoyde3
         oG/g==
X-Forwarded-Encrypted: i=1; AJvYcCUlPYqeueKCZ9vhTmwwyWgWCiuCyJKPUcjnX3PKE0MbLz684cRogo+nSkVXVUHDuFGwg/1I5kHY/mc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHUr+wNZLyy7/Scw37RMseZvr250Ev+iv+5BmaBcbXWx1tXnD1
	NFKkYOOqfAB4wshzN+vgYqfPzlup3zmPFVzgS9jpmq7Ng+G0qL24cQIi
X-Gm-Gg: ATEYQzyE7PDCqZdne2BY8lVgrTlez3lIciVVdru7Z22IokYrsClKap4/akvdZkoBrER
	VCwMXBln+Z9r/hwzIWR7q0ZfOG4oUXEVop6UhB4HYrGxS8ofGtoBFhyZrz9DFZZJgZG5vN9q9Sb
	lrEb//+UT2fm7uF3FAZnrDpPoO7x0PrVHSyUM8F0FngEdeS/kAUsqDTEVFV8XskHHGkkWYcwqVh
	Rr7LXO0ZzjUZ2DTvnXiqKUmei4U+guANYDuJXr6/xGsdFvVevTqmks7TCGKSf/eMc2RS87dPjGC
	qT+ge7hX4hfx2KaER1wA8vmwZS6SZVxxQv3D8tJPtrWTfZY9D7jk/GlL5bd0l4rk3TrW/JofCoV
	Osl56if92LEplVcepRbgtNeVm2fazn7+gq7N5lpAAzfTDJ3IdWvsoJhZEakMKCmv8hxstyTh0hu
	sJNijDSLQVmfHZNuBCFGjWKwkVSR7c6t4DnPS2Mno4XZJuKje4LzlWwwMktxPlIydF8IC9wA0Ot
	yU4UqDRDNpQtsbKl6nRqsOO/S8uPnpQAnlzuVOX1taLBFm8AgUdjuZigptuj2NaTQydIcbXpDwv
	AxBI1nuNqu8=
X-Received: by 2002:a05:6000:430b:b0:439:d242:e8f4 with SMTP id ffacd0b85a97d-439f84342bfmr5875208f8f.47.1773245524858;
        Wed, 11 Mar 2026 09:12:04 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e0050f5e20850bbf776.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:50f5:e208:50bb:f776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm254462f8f.4.2026.03.11.09.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:12:01 -0700 (PDT)
Date: Wed, 11 Mar 2026 17:11:59 +0100
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 1/2] selftests/bpf: Check alignment flag if
 expected result is REJECT
Message-ID: <abGUT1GcbmZJzGqq@mail.gmail.com>
References: <20260310064507.4228-1-yangtiezhu@loongson.cn>
 <20260310064507.4228-2-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310064507.4228-2-yangtiezhu@loongson.cn>

On Tue, Mar 10, 2026 at 02:45:06PM +0800, Tiezhu Yang wrote:
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is set unconditionally for the
> most archs such as x86_64, aarch64, ppc64el and s390x, but this config
> may be not set by users for riscv64 and loongarch64.
> 
> If CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set, the BPF verifier
> detects if a program has unaligned access and then rejects them. So it
> should also check the flag F_NEEDS_EFFICIENT_UNALIGNED_ACCESS if the
> expected result is REJECT and set alignment_prevented_execution as 1,
> then the message "(NOTE: not executed due to unknown alignment)" can
> be printed for some testcases of test_verifier to reflect the reality.

I don't think we should print this message for those rejected tests. It
doesn't reflect the reality: these tests were not executed because they
were rejected, not because of unknown alignment. And we know they were
rejected not because of an unknown alignment since we've set
BPF_F_ANY_ALIGNMENT.

> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  tools/testing/selftests/bpf/test_verifier.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/selftests/bpf/test_verifier.c
> index a8ae03c57bba..a1ae2f044e96 100644
> --- a/tools/testing/selftests/bpf/test_verifier.c
> +++ b/tools/testing/selftests/bpf/test_verifier.c
> @@ -1640,6 +1640,11 @@ static void do_test_single(struct bpf_test *test, bool unpriv,
>  			printf("FAIL\nUnexpected success to load!\n");
>  			goto fail_log;
>  		}
> +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> +		if (fd_prog < 0 &&
> +		    (test->flags & F_NEEDS_EFFICIENT_UNALIGNED_ACCESS))
> +			alignment_prevented_execution = 1;
> +#endif
>  		if (!expected_err || !cmp_str_seq(bpf_vlog, expected_err)) {
>  			printf("FAIL\nUnexpected error message!\n\tEXP: %s\n\tRES: %s\n",
>  			      expected_err, bpf_vlog);
> -- 
> 2.42.0
> 
> 
