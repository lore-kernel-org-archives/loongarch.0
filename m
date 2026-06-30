Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24733E0245
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 18:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782843045; cv=none; b=YH3mWf4yPEbqCZednCQ1vS32Zj4gwp9BlIgoP4qpZ8tO3m2J1cY7mxaKkPCxhkhLlBx5ze+38V2aJzJHVXvH6qFJmbyCTvLooalceTDOP8xe6o62Ik/R+vLCwh7hop2CD6vDaSGS/FYHkQ2o6EoPQ2DWilHFkTTKw4Qnd6YQKR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782843045; c=relaxed/simple;
	bh=0taPItc/ZhqwjMLwUT+K3EuCxI1p/7WtY50pAXfBKVs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=rWyq8GeBEoqyF5prmca3fEbsKm+hPVXb96dIt/pWXxYwczJ5j2IMckTOF8o67X7trf/yPPHZmBcCRXHBVyGXjlB0T5zV/4J8CwGVr6EmipgAaRyfSX1xBtjWAp2EDcXQyffBkXXE4A3rujf0DoPc4veODK84M+u6sf4FazFqQtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Febgvubu; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Febgvubu"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-49600683bd7so162572b6e.2
        for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 11:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782843043; x=1783447843; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0taPItc/ZhqwjMLwUT+K3EuCxI1p/7WtY50pAXfBKVs=;
        b=FebgvubuhzAS/m1zRVSPdwMniOtdOhZhbLP4+b31rDHmbVJ4xMDsLkc4HS2tpN4fkL
         f/DXTaFeIilMVRvAb0TSZBRQvNrTj5MclSxPy/yBA48ond1KHLpBFPsML+3fqJtD+raX
         e/JP1zmYvEPolLxVTzV/bbUm8N9qCc3QjMcZoJqkGxBEjk77xNac7bq7UIeNMdk2j1Nj
         mdf06wCAAvZGe+v4cRcU+sEK0wOKz0nwPH+BXvjMXxnBiqPhlXOxbiCIq+BUqZs24Qa+
         AImRezIFwRB6AEFMYMAg6EU+DoLf8ytUaUOZh3A0IHJHGCNUWK8qhaStk6NJvvu6r1jn
         8u1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782843043; x=1783447843;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0taPItc/ZhqwjMLwUT+K3EuCxI1p/7WtY50pAXfBKVs=;
        b=NxFIxFBJ0Uq4G4v2m5tmUdvxwR2rvN5eeyq3TOdkBBpBGj/vL+6q1K+qynhCfE8pIK
         z0psdFpGm+4hyld0Xy/26DON1cvWQyO9V4woJ8tzKj9Q8JoJQnHfv/U6aFq0SPXORFTa
         +f9qTRU2ptWfJOg1G4HtSiFl1uDvPxOfGm8Vn1NrHcdcCQ+PVuR4IsNk2DUFixNfQmA4
         9ZhRkSKPFUuQhteiCcQJr3a2d+H1ncfF3hye/RCUDMxlMSeXS8MCsZmRN8JcmZrwdIhB
         zfU6KidRGPlfeAO4EjjVvaenQUHgjo3yQjpbNulOTykgNvdjc/TCsJS7DuX+EwewzdLH
         GiAQ==
X-Gm-Message-State: AOJu0YyO83aCbGkGDrxVuf46CRX5Ie6tcQWB5OkDk6+L6zRkd/NEBpj4
	1walkiPqu8gaBcKV7hCbOZIDqpGAVTg3sVLp7wKySci43vvUto4QrE7e
X-Gm-Gg: AfdE7cllqZvKJCzcTcwsoG47ji3LnnhzWpuXnbqjOsGXviyQak47K/3i1JzCTd+ri1C
	88+hVEQvVvfL4ogKuueH5x/nZK30biQWbsJHlvDTnZ+bpZ1aE1XDmP6GZBLN0gNCu97mJwfO+xW
	WM8vnfOnvTKABHKV7K5LYiRWdGweUmAfdcQT+ekyeyhrU9Nr/QgbBEKxo3Cias/Tj7oma/CeMxW
	hDmiBjncEdvlRx+qKpaNK1zvPQfdzRAMiu4aBQZI6dwGplSj8U7lYdtL6PTq5uO0gZVMo5ll+tk
	/0cLWK2pRg+6NXFtHUI4vH4JqiaZUCb+bKrms8IdhlRtnt4ie7B5Z9BHIpwR+Yxtv6Dy5gOjp6S
	pL1U8AvYeshs1FidBzOeX63eoTQ6kqrec8lEiOEMhSLG63Af+giWdYvL7nzM89W6khlw6S0EBAn
	5D/CUEp3VC/km7/wduNt4f6yuTMuGRfi+0tJJXo7oScRQt8MHfhhVxaCUXTuPGh6D+OgS+M3YLV
	qKFPxE=
X-Received: by 2002:a05:6808:1913:b0:495:e48c:4e42 with SMTP id 5614622812f47-495eb006eeemr4169487b6e.40.1782843042753;
        Tue, 30 Jun 2026 11:10:42 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:5c::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4935536690esm8853280b6e.13.2026.06.30.11.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 11:10:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 11:10:41 -0700
Message-Id: <DJML42EC3DYK.16C7NCKGKW6WB@gmail.com>
Subject: Re: [PATCH bpf-next v1] selftests/bpf: Add benchmark for tail call
 performance
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>
Cc: <loongarch@lists.linux.dev>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc
References: <20260630022306.10017-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260630022306.10017-1-yangtiezhu@loongson.cn>

On Mon Jun 29, 2026 at 7:23 PM PDT, Tiezhu Yang wrote:
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/benchs/run_bench_tailcall.sh
> @@ -0,0 +1,18 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# 1. Load the official common benchmark utilities
> +source ./benchs/run_common.sh
> +
> +# 2. Strict error handling configurations
> +set -eufo pipefail
> +
> +# 3. Use default bench binary path if not exported by the framework
> +BENCH_BIN=3D${BENCH:-./bench}
> +
> +# 4. Run with strict core affinity and isolation for reliable profiling
> +RUN_BENCH=3D"numactl --physcpubind=3D0,2 --membind=3D0 nice -n -20 $BENC=
H_BIN -w5 -d20 -a"
> +
> +# 5. Capture the output string and pass it straight into summarize_ops
> +# This satisfies the framework's internal parameter bounds without trigg=
ering set -u.

Too much LLM smell here.

In general, I don't think we need a bench for tail calls.
tail calls are more or less deprecated and often in the way of implementing
new features (like 6+ arguments). There is no need to work on
improving their performance.

pw-bot: cr
