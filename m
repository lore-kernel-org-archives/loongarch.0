Received: from mail-wr2-f0.google.com (mail-wr2-f0.google.com [74.125.225.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931D531F98D
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 04:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786941530; cv=none; b=ElNPHdTyqdYXD3Bkx/3RJ8X/5/78bCs0nVaHZEnOPC1DiKaO1cI9y9B1PKxesT2EyVqY4FnUv6KiPUe1psm07bOLHBabBO4oA7NfjjbWJfvuAKXANJ/UvJwS5P52UkIENW4C7mt4uVuSqgvB1JOav/EE9mfoSGnobS37851sYTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786941530; c=relaxed/simple;
	bh=fkQiXS2dj0HIQT6nxsCnV4dj4UNnrygOECOoDn6j4q4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=TZ4KcVlUIsOR9mIlyFofYSj6wPax9p3DF+NOqTZYuIC+Yn+7DLHTDS0d/iqdXiWO7NZZ74fwQcVspmd9W41tWknniSJkVVSnGOwJRcOFULtD+IeOtDRxwGiWRsUXxCVIPJg0j55Rk4wFhX+rlFLo8mW/EDAlpAgZj/aj9b4bFPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tMMUqA0V; arc=none smtp.client-ip=74.125.225.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tMMUqA0V"
Received: by mail-wr2-f0.google.com with SMTP id ffacd0b85a97d-46cbf263216so1473075f8f.1
        for <loongarch@lists.linux.dev>; Sun, 16 Aug 2026 21:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786941526; x=1787546326; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1c8foKhzrYQ6izTIE48GxSA/nmG3AeRv3jsPbmv5QtA=;
        b=tMMUqA0VLeRsVKmKjKoFAxCuB6nO62/GdI91HmbIbVnXo1kx5JAVZVe878SbBnZs34
         vvHor1g1MbPMw2YzPXmBPdicAFm/f9O/qGWQ4PFy6SkehM4r3vXCGe7IpY3tOzJEpfu2
         VIaCwkLQne/GfLx0C2C6Nb/wkzMd8A6Lduyr84WmZWfXn/UxK36aAaf5WcPIlOFUOTsH
         VkL4onMSb7rERtFyn71UGtDRxngR7QE4AfrguuPH69Y6hS0aUWxFCzaipGAAtFNMxTd4
         L1q1S3/vpkeQZk5tWi92Q/IT2TT0YwlcLzrj7DH0RllPodNpGDJ1lwMPBijopW8GY9V3
         8DAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786941526; x=1787546326;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1c8foKhzrYQ6izTIE48GxSA/nmG3AeRv3jsPbmv5QtA=;
        b=cuTje95nyk5Q75O0BxaHQtrLVQ3zSrBl1wggONuZFaIdhGIBl8B+LAoswWiDAG8VLZ
         eP9VzpbTnLl2DPwbNEa7flNKmKHioRCLcZdkPQ3Tgz2uZfUs1JBCihn9lndpqZ19vXu5
         ZZyg5+Es5gQYQZ9Nu0L2Wr7gBfAVMC0uzaHdDDRcjQh1/n7R80nB3Tqg1O3oVFxiaW+4
         iPUSu61YaSkYWHqh4Qdn+fTXAfXqo5qIKAAj1C/ca8vfPIg2eElWglzCNdzzmO/RynZM
         Rq+Uzrw/wIyFyqPLa7LVWhvRPveJgutF5Lyl0x0A91ibw3lFQpZhQRumlwZZxzd5IIZ9
         tt8A==
X-Forwarded-Encrypted: i=1; AHgh+RpZBZx2AazOle7aVt5toQuzcqOVcmcsMQrjth22ZLKua9fP7ZJmAZ6F48WtXG0OUqLiRcbwhKnWR7w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxU/mwNmKXe+tGHszdJwHqen98YrUYWfmfoHVbop4wLWix7KDFL
	ucgyRtXyylU4SKP1hz6nWUnxQJI1kVQNQ/kpe9tUO4x3ztkztqMQNCCQ
X-Gm-Gg: AR+sD133/pNyM5pqlrdfytP8L0RmQ8QWA8dIbZtOsVhhCIQE8D3L9ySZm73I6ukmZcQ
	G6zb7J/ymHsfcmmguxvgaetdMrcSiilLvCDpGdwQl4jzYNp3osPPT7o9peAmHYLoa4sW5KF1jt9
	a7X0FsZriG1evOHolNqKOZdUg6FiDl1PisATEoO2qV/9ptFrOJszSlZSjqTPZ+Bcz89Ogxpz2Sa
	moalgyqO9BFQdzr3HEKvDTG+EC9KMb9yPs8lVKpln8C+CvM8cufnO8KFLzkHzI2e4wHzjAeMutf
	nAPeS7gViIDYsfJu4aAP/Te5fAbu6m+SvM3aG7tsJNNVpkJGSEf+ljaRD0QbwcmV9B9cqXNye1K
	pCQOd+6uRJMtpJdULmIAc0UDaHNRzb26yWZQLYcXmGcQ071j83zl12IFmo0ad18YkRAXlLMxYd2
	50kptv78tWzuGC8DKn0BgRj1wvfaKQOEL+fYc/OqYIwMbzq+cGYYqJW3VtU5eo2BqDooNyaHEUn
	xS5udxrIKVoAgMOcm2OgTTgcl1H6y8x9/pJzXoqeWMFyj1+6Rtq+1JnWG240+GY6i+2c7m/ewwD
	wgtbJsu0Bkqm23ewpI4z+onSaoU=
X-Received: by 2002:a05:6000:25f4:b0:47f:7129:6e2d with SMTP id ffacd0b85a97d-48160751f31mr34517595f8f.17.1786941526370;
        Sun, 16 Aug 2026 21:38:46 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a7c57fsm625297f8f.22.2026.08.16.21.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 21:38:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 06:38:45 +0200
Message-Id: <DKQXWK0ILLSS.UF4CVFD9NO3I@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Vincent Li"
 <vincent.mc.li@gmail.com>, "bpf" <bpf@vger.kernel.org>
Cc: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Eduard Zingerman" <eddyz87@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, <loongarch@lists.linux.dev>
Subject: Re: bpf selftests timer_lockup intermittently locks up kernel
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <CAK3+h2xOSEZUHhou7N2cRL-aGrZCNSm45g+P7thObMe+fpgYCA@mail.gmail.com> <d06a7557-fb51-2be9-63cd-3269533476b2@loongson.cn>
In-Reply-To: <d06a7557-fb51-2be9-63cd-3269533476b2@loongson.cn>

On Mon Aug 17, 2026 at 6:04 AM CEST, Tiezhu Yang wrote:
> On 2025/8/25 =E4=B8=8A=E5=8D=882:26, Vincent Li wrote:
>> Hi,
>>
>> I am running bpf selftests on a Loonarch PC and observed intermittent
>> kernel lockup by timer_lockup, then I can repeat the lockup just by
>> running the timer_lockup in while loop every 5 seconds, I could not
>> find a good x86 machine to test, and I think this might be
>> architecture independent. I don't have a good way to capture any
>> kernel log messages for the PC after the kernel hangs, and I had to
>> power reset the PC.
>
> ...
>
>> #458     timer_lockup:FAIL
>> Caught signal #11!
>
> I recently spent some time investigating this and
> managed to reliably reproduce the issue.
>
> After adjusting some kernel configs and parameters,
> I successfully captured the call trace.
>
> The following patch fixes the issue, feel free to
> test it:
>
> LoongArch: Fix __smp_mb__{before,after}_atomic()
> https://lore.kernel.org/loongarch/20260817035908.460-1-yangtiezhu@loongso=
n.cn/
>

This looks correct to me. Also, nice that the test actually reproduces the =
issue
without that store-load barrier present, which is good validation for the k=
ernel
side fix.
