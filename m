Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB5A137E
	for <loongarch@lists.linux.dev>; Mon, 10 Mar 2025 04:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741581246; cv=none; b=WBwgtPKjV6e/S255Xcnpw3Gcf1Nr2GpJKaS+211WEkqYBgMnHpLOCoLvxIoVfFbEXFguPXddKY9hE2vFnxp6TNrqJZrNdUrjiPzHs2oPcuOPW3+H79IBVkQO9pZAYU2sVaj51yxyF/CghnIO0fHQa3RlITDA1A/eiGoNHVHtk1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741581246; c=relaxed/simple;
	bh=TWCm+CRWlgu32Y0M73b1SpXa9LjDCzu9iKJJhuYonhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZgqvPYAEMbUlojFXECHHfwSBmWXfeijOEafnoIjYa7jeR+IbDV2LI4a/gO6xwNY6fNy46EpcdJdLGCZOv/rAfjScMbH/SDXgTEYpcgCUy221fTQcAhycS71FVJfGYOtjbKMH+V7Vo+P1HjSesgpndCt/MAznwcY4rgc4iJA29w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=OerPT92R; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="OerPT92R"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2243803b776so51896035ad.0
        for <loongarch@lists.linux.dev>; Sun, 09 Mar 2025 21:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741581245; x=1742186045; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=13ChRW79RLZKXPIzEEQT8n5qa9QFsChJtd4X7Rr3YO0=;
        b=OerPT92RGYqTL0HHhGUMLTxagjZBOGI9DPzizsr9iiNTMbeDAlwOMxOZMgTkZsqNBi
         /nZg46CCl5LEzfhB/MalImiWXOMopCqPRI/vVn4CidzqM+kyuE96wZxz1UBjhoTIA4wU
         oqACIBM8dLLvzCkynVzBXaiajut0G7h2z27F34dwPjWVUdMWZQSCxGPIaqOfxav+ww/C
         ga32H0SSjGFGyS5IpjcBtAiIWmA40smpuBvYEnZilfbyWDxg12vcnICkEnaoc8iJpnlQ
         5A4qhQrR/8fnMvmIOgMFxE+P6VbdqNXJIvSRR6kS3+rk1AAT0T+P0M87xGK7GZBDQs4f
         +UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741581245; x=1742186045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13ChRW79RLZKXPIzEEQT8n5qa9QFsChJtd4X7Rr3YO0=;
        b=KESzou78XmwdtpNzqCyK2C+WSzmXfJ5HQYqBjWDRmRj4JTDvZavculMTCOv8hNhX4o
         Wjs/TAWoszyddoi1ymIoAhZxojVhaeHqgLRwpHQs4Qf6tvSeAfB2HrBzFAfOHgw/DUY1
         InSlwyyV/qw/z0W/+zBsMC8nd0mAV/YUCNr+YBrxKBWlfoFWORrDW02zpbI3CrgkE4bC
         D96O7NT/V/WvpnUIZgUKXh9Vy9bSOnjSInyI6Xd1G17a7cBXg9i7qOOYVK8I0W/TYi0U
         TA7V8p5tGQuFq9i1GX2WhVYe9/rl9xhAMvP/v4ECrCYiv1v7LK+MNzeYSBZkw+P+bdIl
         OahA==
X-Forwarded-Encrypted: i=1; AJvYcCVjrFcJmyO7EMkO+cMd2mv/4CsELyIcdzFs4Zlhrz/mSgR10uog+8JOk3qqm11j2CLe3c+PfSJfF9A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc8NtRYUmQZmcCAmnNDBK9rM52oUsrt6SaD1/UrHFqMXNUmApK
	L240Z4Kbl2VejRxjPCDpuPyu+U+iBNuIIQPvt2oZ0MLBvBqjdUkmz+oby/x31E4=
X-Gm-Gg: ASbGncu0gewxJHqclOVxs/NJxE0ntr5QtVbNlmj1NXX7UYjGp9ClgYTJZDdSF0OjPIN
	2RMS/OAFGHNPynG7lZZFgrW6ouHmZv7MBZPw4mAGZkJ8bDdUaGSX/IN5xTO92m+DLlMny4hkpFD
	E4Vqf0L/zitQV76J1WaSO3OtFKF0ybQj0s8odprY8qDfkq9Ndwz+zLGbv6wmVMEKTeC4AtSujZK
	6MzXTMSA3EERgW04NYi0244NGo17j6MdK3xV1O2Pqrf9pkIfpBIOUZfk2C6B7TolX1m7cXjMtJV
	A9FKdBCxYRdmoaDgN1JKcxtBIl2nsdvt05hkx4A=
X-Google-Smtp-Source: AGHT+IG23e6e0NfcQWHHui1UgTUeATKpxeYS9TWIFzolvcIGQw0afq6BAO5/9cuUmkmceElelfdLBg==
X-Received: by 2002:a17:902:ea0c:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-2242888b35dmr161699375ad.20.1741581244773;
        Sun, 09 Mar 2025 21:34:04 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:677:c5f4:a978:3253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f999sm67389125ad.141.2025.03.09.21.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 21:34:03 -0700 (PDT)
Date: Sun, 9 Mar 2025 21:34:00 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v5 4/4] entry: Inline syscall_exit_to_user_mode()
Message-ID: <Z85ruFUoBQM60Vd8@ghost>
References: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
 <20250305-riscv_optimize_entry-v5-4-6507b5dff3ce@rivosinc.com>
 <87senn3dh1.ffs@tglx>
 <Z8zb-L8bFMh_YHxO@ghost>
 <87jz8y3953.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz8y3953.ffs@tglx>

On Sun, Mar 09, 2025 at 09:23:20AM +0100, Thomas Gleixner wrote:
> On Sat, Mar 08 2025 at 16:08, Charlie Jenkins wrote:
> > On Sat, Mar 08, 2025 at 01:37:30PM +0100, Thomas Gleixner wrote:
> >> On Wed, Mar 05 2025 at 16:43, Charlie Jenkins wrote:
> >> > Architectures using the generic entry code can be optimized by having
> >> > syscall_exit_to_user_mode inlined.
> >> 
> >> That's a pretty handwavy claim. What's the actual benefit in numbers?
> >
> > I put the numbers in the cover letter! Here is the data I gathered:
> 
> They should be in the change log as the cover letter is not part of what
> ends up in git.

Yes good point. I will add this data here in the next version of the patch.

- Charlie

