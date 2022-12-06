Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DBB17C3
	for <loongarch@lists.linux.dev>; Tue,  6 Dec 2022 02:10:52 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.110])
	by gateway (Coremail) with SMTP id _____8BxVPCmpI5jxHEDAA--.8048S3;
	Tue, 06 Dec 2022 10:10:46 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxXuClpI5jPFEmAA--.28256S2;
	Tue, 06 Dec 2022 10:10:45 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: chenhuacai@kernel.org,
	corbet@lwn.net,
	alexs@kernel.org,
	seakeel@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	kernel@xen0n.name,
	wu.xiangcheng@linux.dev,
	jiaxun.yang@flygoat.com,
	liuyun@loongson.cn,
	linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev,
	siyanteng01@gmail.com
Subject: [PATCH v5 0/2] docs/LoongArch: Add English and Chinese versions of booting
Date: Tue,  6 Dec 2022 10:07:57 +0800
Message-Id: <cover.1670289933.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxXuClpI5jPFEmAA--.28256S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Jr1furW3urW8XFyUGw4rXwb_yoWftFXE9F
	n7J3y0y3y7KF98JFWvqr4UJFy3CF40k3WYyFn0gFW8GF1YyrZxWF97X3s8Cry0vrWDZwn8
	CrZ7trySyF12gjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	17kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJV
	W8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU

v5:
* Add LINUX_PE_MAGIC.
* Modify some words under Xuerui's advice.

v4:
LoongArch supports ACPI and FDT, so let's add the description of fdt.

v3:
* Add a description about boot parameters (a0=efi_boot a1=cmdline a2=systemtable),
  and then rename the file to booting.rst.
* remove some blank line.

v2:
* Fix magic start address.
* res14 -> res4.

v1:
* Add boot image header.
* Translate boot-image-header into Chinese.

Yanteng Si (2):
  docs/LoongArch: Add booting
  docs/zh_CN: Add booting Chinese translation

 Documentation/loongarch/booting.rst           | 43 +++++++++++++++++
 Documentation/loongarch/index.rst             |  1 +
 .../translations/zh_CN/loongarch/booting.rst  | 48 +++++++++++++++++++
 .../translations/zh_CN/loongarch/index.rst    |  1 +
 4 files changed, 93 insertions(+)
 create mode 100644 Documentation/loongarch/booting.rst
 create mode 100644 Documentation/translations/zh_CN/loongarch/booting.rst

-- 
2.31.1

