Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77103285068
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786956525; cv=none; b=BZ0aq2z4Kf3EPegENdviVMEHktvawOUdmqlf19nBD1uczJ4Jg+kFsM/tNKpr+22tqCI51ufmGHbPPM6W+nHPExM7dN1/K//O9uxQOKB9N2YhXIzj01AKB6+gJYZpRmq3P5jAFjIiK0gEj3C84d8XbdRJAUIpOTh1n+px4fFzE9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786956525; c=relaxed/simple;
	bh=sBEqRV+X3NJ+d00hspKPL+K2GPhjRi1NUVyJkyc0LH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aCExyESrJr+KVK0MY5dCsADcYba0VACF8QnTK/k7KlU3iw5/cYccAknLLG0qAXTsMjrzGQjC+69IUZcZ+gj8kpeGXinJvw1WlRdvvVwxLFbJI2+MHqGw8kW3YS7IGvQioKcwdkKHX3pHl3bdicdF6czxtAOS4+q2I8VeEr9c3cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=U0ohtq5k; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="U0ohtq5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786956433;
	bh=ShiEhLjgdRYcBEILZagrMbIlp206gnNqakMCvdm4POo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=U0ohtq5k2ynC2DVuGOYZuZjrJvdmRWGHQU45bXsFROpB+VQBqU1snBPHPxfWgjcGG
	 K02y0hK8klRLPyKUmNIW95DbTHg9wCEqNiGAnUowxv7c5005WYrZM5+HLhIFasko50
	 PTr3fCZY0mqUanNObIqwBp++RRimn9EmyHiLVs9E=
X-QQ-mid: esmtpgz13t1786956424t3965a016
X-QQ-Originating-IP: TeRbYOE0z7epXa4Si/rfgGT/K8pzRUT/IIHKSyAVVyQ=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 17 Aug 2026 16:47:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3178264705605889229
From: Wentao Guan <guanwentao@uniontech.com>
To: vincent.mc.li@gmail.com
Cc: alexei.starovoitov@gmail.com,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	loongarch@lists.linux.dev,
	martin.lau@linux.dev
Subject: Re: bpf selftests timer_lockup intermittently locks up kernel
Date: Mon, 17 Aug 2026 16:47:01 +0800
Message-Id: <20260817084701.2600044-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CAK3+h2xOSEZUHhou7N2cRL-aGrZCNSm45g+P7thObMe+fpgYCA@mail.gmail.com>
References: <CAK3+h2xOSEZUHhou7N2cRL-aGrZCNSm45g+P7thObMe+fpgYCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OHUP+eFjYHonn6hGGyhyqQXl85sHg+dnF0ZApoDdl9v/RzYNp7VFQ7d6
	OS/PQcQ4nDSLIromW4ldFQlxTQQ+/i1ulG5VHanA6wybU3icw/8k6MZ4CZy6dJ6FsD8d91x
	Cg6lE4A2qSjZh7tpCiMRqq8OLO3p0gl4yCywD0R+OYUL8/0eGQ+i2rUjJqZuK8dt/FCn/4k
	j2f1W9AjnwQwVuj2JbvirET/1fTT7Iln/FcjkUdTnvhKJPjjloXZkajWuDyy7xA3HBP2c0Y
	URB/iEsFufat2GlkqYtZLAeapuxU865W1xIHWiqbBmDCd3sfBsVlGK8ndy6UVSqkkWy7bzM
	0Q64WgGcepR7vKpxfJDLhVTLJjhm2up7mnNiwVn5el/gI8tl3ZDF/fdX2SA3ZhnDIDc486P
	/VFR/ECHTU/9XKJjwNBjmWZMMY0SCtPPOEAf/0a8fWUMcewgREAXlesvVxpfdRX1gCBX2tm
	TfcHDqfTLt7xZX1xiEB6LJwYUzznCh42TJUtCWLBoy5j1Uro/bS4DgtV8EoU4dWkxpaPUjm
	2/BKWFp9kVVmSZjcuEdfXnRgoBCIkUHep0nvB9wD8OYarqoJmP4+953t0ltOzsmcH1tZD5P
	D19SOZaAlbF9k3An8Cw3s7+uCZ/CuKe6edwngvTT8w4fUpk7LPysG2DSeSEcNVONY1sAnN7
	OpfQgZl5Xr7AA1X/9JTltOLW8/Kh5WZV85L3zYXu2luxTwAAqYlb5ODIFDi3wppQXzx/Qhi
	aa5i/LAsunh95A0zfNCtSVghedLzgv1286Tzz8++Oim+s7WNojpfOK0evaTrJ+dY9fCgFmu
	JVJQ5o2hD5TUJ7eECfKC2l7KHyVMjQGYE6oGzNMSnXie2HXDR+JfCyDKJ17os+TXO64FCyU
	wqIRvROK9w2aKnfw1MzXGtB7/o9vRyIBys8ZIoASo769Si4N4CBM9qJi/laYIqMy1z8OVj9
	ahpcjcGuND5f+6Fmfy0sYPE84FbWOB+QClwRfX4p7OpGUKK866zTrTzSNO1u0snukBHnKb5
	M+nTxctAm52HBhyyb8g3sgCRDEBDo=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Hello,

You may try netconsole to capture the crash log:

Reproducer Kernel config:
CONFIG_NETCONSOLE + CONFIG_NETCONSOLE_DYNAMIC=y 

Recv server:
run: nc -u -l -p 6666 | tee /tmp/klog.txt

Reproducer:

1. modprobe netconsole/or y(skip)
2. mount -t configfs none /sys/kernel/config or mounted(skip)
3. mkdir /sys/kernel/config/netconsole/target1
4. cd /sys/kernel/config/netconsole/target1
5. echo 192.168.1.10 > local_ip # 192.168.1.10 is reproducer ip
6. echo 6666 > local_port 
7. echo 6666 > remote_port
8. echo 192.168.1.20 > remote_ip $ recv ip
9. echo 1 > enabled
10. echo 8 > /proc/sys/kernel/printk
11. optional: echo xxx > /dev/kmsg to test 

BRs
Wentao Guan
