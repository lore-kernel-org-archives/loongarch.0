Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53644372ECC
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244621; cv=none; b=ILCvcNbRtVQosCfxjS6zOxPztv/DfQysTpIouOSAC1uCsOizqi5c0TP0bA8BmxtvpPCNzQKgIEi+ntP+Ms6scahYt8suhbeEPw59BCOwZ5wx0qf25ouVMHeRK+/Y5obzgHo5QwVMDZrlEXIpM6O6jihqHv+JCayl/6/EsF5r3BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244621; c=relaxed/simple;
	bh=f5g5NWN4qwwYTPK6cTHmK6+E5XPwTlNKpTtoNyYOZ6E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=uKkKBls2G3cI1wGAxpWUjpX3nQjD6Q4rodhV8ho4hgHMRy7d5cPfSmzAXqkf7IE7Q3mVLP5GW1vPIDJGQGkOMFAQ+MxYgJP2/8c07rWGf5u9Fbfn4Uhir9LhvQ19x/as1tjdpPMfzPldoz1sQ14IQpfWEzNBdsZ2GtkEkrQ29hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b=DikTIMix; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b="DikTIMix"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cd7284782dso316851385a.1
        for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20230601.gappssmtp.com; s=20230601; t=1773244619; x=1773849419; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqjnrikQXGH3suAtnbwio+Ftux9br8uF4UCOSbRtEbc=;
        b=DikTIMix7pRCrD+I+XQqb4l1n86u6HLqHRc//CZvnH8qj/ZNLG+7Hj+sxEWsk2RS6b
         CmQW7PqisP4rxXbTyMcANvZLmOyI6QpujwPnlQNIf1bsjrLZHJKn3hgaO4sy3pX/+LqO
         xwBJD6gtmL7SiSattSf4MM7pgk7RRFx5svLiQ2mNuRjoT5mwsq6nkbiZy4mM3Fcudd0y
         hZ+eSd7JKSVxBwkIlC3KVJjrdgm1fN+C0LXUtO6w6o5btTKeFcFjhgbR2B25u3yqsKQh
         2q1+CAowjXvpurnfeXPocsE8mv7YwwsIXR3VYL1yRtgWU0xgF8qOwo9ZAW3qDCN/Ij9P
         m+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773244619; x=1773849419;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eqjnrikQXGH3suAtnbwio+Ftux9br8uF4UCOSbRtEbc=;
        b=vFYK/yS5oZKouAZv4nBZoDt1nokdAnIXkYFQMTU6NrxkKC6Zxv3hT75DkdP8fOk0Mb
         IBcIsxZ/Kcy4UNKHywxg/YaEXQfMHZCpGyJU2saT1CYfCFZBe9r9lVPGcZxnFH18ZK7Q
         AC6HbN92Whs86y2+eI2zmvCGHsIAI9OM6ODQs4vgvf6D/YNkjWH+JbwkovYDbKs8BetN
         s1Ofn0A0N5QCqAXt/pWxR/9qL5B+WiVGVMMPUVw6SGSCZoeGzAtxXlym5C8hLzwwNgz1
         zMmi7petW4wLrqNrQcWu+5yCMjEc1rx+0U3mCg6M6+KZdkT34haLCvpah1fzoRvZ1Vax
         zOBA==
X-Gm-Message-State: AOJu0YzaX3U1uu9qCc5+296UyuXj8/wXv9Jf5dFOSM7CbPghFbP/wBsW
	+M5XmLblaL/tPZw/tB43LNiJTUjZ3Uy18DMA/1hMxN4EjlnSIVVU6RiHBm4ERyt0tIY=
X-Gm-Gg: ATEYQzx8UXu+OQJxtjAJ/zxRdFvvnfGQneHLVoF6oQJb85AEuzP/wbESANObkReG59u
	EqufdcRasfCZDc5eVcMKBPgPJTDoRI2Kyqip7MRrLqr2lUBJunF83IkqzU+rK/XLd0cs1dqWrAR
	KKjlPbh3AxLQS4bp6HUUJ+wvpjlYITBfl7hA8S4XHbH2XbEix8VQ4v5oe5ufk3b55KvDuWnE9T+
	2JG9lDtsNvjkM/Xsnpa8MbdjeMwSigXcCWKHN+oHKo/Qr9s9ELq6o+XN5qlb2iv18LhCcxMeTry
	5bMSKYDmWaHAii/LOX1fHWBdFEzyPi617FbF8Zy9P/kHU8QTMUP/SL9U5Az20t3dtC2Jf3RA9xD
	5aI6hqSYu8YS/5JjpYm7BdLXTTBCti5eIoyhYxWcD4K8S5QdXXt0BlW/FhYDZ3ZIY9R42AYqqLl
	mAMKXA1BG8iGKVpXQ9b1+Mpu8=
X-Received: by 2002:a05:620a:6cc5:b0:8cb:4ba9:ccec with SMTP id af79cd13be357-8cda1a7ceb0mr365476285a.72.1773244619117;
        Wed, 11 Mar 2026 08:56:59 -0700 (PDT)
Received: from localhost ([140.174.219.137])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fda2c6sm157668785a.13.2026.03.11.08.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 08:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 11:56:57 -0400
Message-Id: <DH02R7I6EAUH.16649BMB7V1N8@etsalapatis.com>
Subject: Re: [PATCH bpf-next v1 1/2] selftests/bpf: Check alignment flag if
 expected result is REJECT
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Hengqi Chen" <hengqi.chen@gmail.com>
Cc: <loongarch@lists.linux.dev>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260310064507.4228-1-yangtiezhu@loongson.cn>
 <20260310064507.4228-2-yangtiezhu@loongson.cn>
In-Reply-To: <20260310064507.4228-2-yangtiezhu@loongson.cn>

On Tue Mar 10, 2026 at 2:45 AM EDT, Tiezhu Yang wrote:
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
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  tools/testing/selftests/bpf/test_verifier.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/=
selftests/bpf/test_verifier.c
> index a8ae03c57bba..a1ae2f044e96 100644
> --- a/tools/testing/selftests/bpf/test_verifier.c
> +++ b/tools/testing/selftests/bpf/test_verifier.c
> @@ -1640,6 +1640,11 @@ static void do_test_single(struct bpf_test *test, =
bool unpriv,
>  			printf("FAIL\nUnexpected success to load!\n");
>  			goto fail_log;
>  		}
> +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> +		if (fd_prog < 0 &&
> +		    (test->flags & F_NEEDS_EFFICIENT_UNALIGNED_ACCESS))
> +			alignment_prevented_execution =3D 1;
> +#endif

This doesn't look like it's breaking anything, but it will cause all=20
tests with F_NEEDS_EFFICIENT_UNALIGNED ACCESS to be reported as failing=20
due to unaligned accesses even if they actually failed due to expected=20
errors at load time.=20

Which test programs is this fix targeted towards? Can't we just skip
those tests for riscv/loongarch instead of adding this workaround?

>  		if (!expected_err || !cmp_str_seq(bpf_vlog, expected_err)) {
>  			printf("FAIL\nUnexpected error message!\n\tEXP: %s\n\tRES: %s\n",
>  			      expected_err, bpf_vlog);

